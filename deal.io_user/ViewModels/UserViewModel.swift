//
//  DailyFeedViewModel.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import Foundation
import FirebaseAnalytics

class UserViewModel: ObservableObject {
    // created synthetic data to figure out view functionality
    // TODO: replace with JSON objects that pull from Firestore using the API
    // TODO: figure out what format the dates will be sent in, completely changes functionality
    private var LOG_TAG = "LOG: ViewModel"
    @Published var tabSelection: Int = 0
    
    @Published var currentFeed: FeedType = .DAILY
    @Published var dailySortType: DailySortType = .DEFAULT
    @Published var upcomingSortType: UpcomingSortType = .DAY_ASC
    @Published var deals: [Deal] = []
    @Published var restaurants: [Restaurant] = []
    @Published var nameMap = [String: String]()
    @Published var locationMap = [String: String]()
    @Published var loading: Bool = false {
        didSet {
            if oldValue == false && loading == true {
                self.clear()
                self.refresh()
                loading = false
            }
        }
    }
    
    private let mDealService = DealService();
    
    init() {
        self.getAllActiveDeals()
        self.getAllRestaurants()
        print("\(LOG_TAG) Init")
    }
    
    func refresh() -> Void {
        logRefreshEvent(viewModel: self)
        self.getAllActiveDeals()
        self.getAllRestaurants()
    }
    
    func clear() -> Void {
        DispatchQueue.main.async {
            self.deals = []
            self.restaurants = []
        }
    }
    
    func getAllActiveDeals() {
        mDealService.fetchDeals(timezone: DateUtil().getTimezone()) { result in
            switch result {
            case .success(let deals):
                print("Deals: \(deals)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.deals = deals;
                }
            case .failure(let error):
                //TODO handle error 
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getAllRestaurants() {
        mDealService.fetchRestaurants { result in
            switch result {
            case .success(let restaurants):
                print("Restaurants: \(restaurants)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    self.restaurants = restaurants;
                    DispatchQueue.main.async {
                        for restaurant in self.restaurants {
                            self.nameMap[restaurant.id] = restaurant.name
                            self.locationMap[restaurant.id] = restaurant.location
                        }
                    }
                }
            case .failure(let error):
                //TODO handle error
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    /*
     daily requires that daysActive[0] is true, that's all
     */
    func getDailyDeals() -> [Deal]? {
       // print("\(LOG_TAG) Daily Deals \(dailySortType)")
        var sortedDeals: [Deal] = []
        for deal in deals {
            if deal.dealAttributes.daysActive[0] {
                sortedDeals.append(deal)
            }
        }
        

        switch dailySortType {
        case .DEFAULT:
            sortedDeals = sortedDeals.sorted { (deal1, deal2) -> Bool in
                // Compare the DealEnded attribute
                let deal1Ended = DateUtil().checkDealEnded(deal: deal1)
                let deal2Ended = DateUtil().checkDealEnded(deal: deal2)
                
                // If deal1 is ended but deal2 is not, deal1 should be after deal2
                if deal1Ended && !deal2Ended {
                    return false
                }
                
                // If deal1 is not ended but deal2 is, deal1 should be before deal2
                if !deal1Ended && deal2Ended {
                    return true
                }
                
                return false
            }
          
        case .START_ASC:
            sortedDeals = sortedDeals.sorted(by: { DateUtil().getHourDifference(hourOne: $0.dealAttributes.startTime, hourTwo: $1.dealAttributes.startTime) < 0  })
        case .START_DEC:
            sortedDeals = sortedDeals.sorted(by: { DateUtil().getHourDifference(hourOne: $0.dealAttributes.startTime, hourTwo: $1.dealAttributes.startTime) > 0  })
        case .END_DEC:
            sortedDeals = sortedDeals.sorted(by: { DateUtil().getHourDifference(hourOne: $0.dealAttributes.endTime, hourTwo: $1.dealAttributes.endTime) > 0  })
        case .END_ASC:
            sortedDeals = sortedDeals.sorted(by: { DateUtil().getHourDifference(hourOne: $0.dealAttributes.endTime, hourTwo: $1.dealAttributes.endTime) < 0  })
        case .ACTIVE:
            sortedDeals = sortedDeals.filter({DateUtil().checkDealActive(deal: $0)})
            
            // if we want to sort instead of filtering
            /*
             { (deal1, deal2) -> Bool in
                 // Compare the DealEnded attribute
                 let deal1Active = DateUtil().checkDealActive(deal: deal1)
                 let deal2Active = DateUtil().checkDealActive(deal: deal2)

                 // If deal1 is active but deal2 is not, deal1 should be before deal2
                 if deal1Active && !deal2Active {
                     return true
                 }

                 // If deal1 is not active but deal2 is, deal1 should be after deal2
                 if !deal1Active && deal2Active {
                     return false
                 }

                 return false
             }
             */
        case .ENDED:
            sortedDeals = sortedDeals.filter({DateUtil().checkDealEnded(deal: $0)})
            
            // if we want to sort instead of filtering
            /*
             { (deal1, deal2) -> Bool in
                 // Compare the DealEnded attribute
                 let deal1Ended = DateUtil().checkDealEnded(deal: deal1)
                 let deal2Ended = DateUtil().checkDealEnded(deal: deal2)
                 
                 // If deal1 is ended but deal2 is not, deal1 should be before deal2
                 if deal1Ended && !deal2Ended {
                     return true
                 }
                 
                 // If deal1 is not ended but deal2 is, deal1 should be after deal2
                 if !deal1Ended && deal2Ended {
                     return false
                 }
                 
                 return false
             }
             */
        }

        return sortedDeals
    }

    
    /*
     upcoming requires that any of the daysActive are true or if daysActive[0] is true, then CurrentTime - StartTime is positive
     */
    func getUpcomingDeals() -> [Deal]?{
       // print("\(LOG_TAG) Upcoming Deals \(upcomingSortType)")
        var upcomingDeals: [Deal] = []
        for deal in deals {
            if (deal.dealAttributes.daysActive[1...6].contains(true)) {
                upcomingDeals.append(deal)
            }
        }
        
        var sortedUpcomingDeals: [Deal] = []
        for i in 0...6 {
            for deal in upcomingDeals {
                if deal.dealAttributes.daysActive[i] && !sortedUpcomingDeals.contains(where: { $0.id == deal.id }) {
                    sortedUpcomingDeals.append(deal)
                }
            }
        }
        
        switch upcomingSortType {
    
        case .DAY_ASC:
            sortedUpcomingDeals.sort(by: { (deal1, deal2) -> Bool in
                let deal1Arr = deal1.dealAttributes.daysActive
                let deal2Arr = deal2.dealAttributes.daysActive
                let firstTrueIndex1 = deal1Arr.firstIndex(of: true) ?? deal1Arr.count
                let firstTrueIndex2 = deal2Arr.firstIndex(of: true) ?? deal2Arr.count
                
                return firstTrueIndex1 < firstTrueIndex2
            })
            
        case .DAY_DEC:
            sortedUpcomingDeals.sort(by: { (deal1, deal2) -> Bool in
                let deal1Arr = deal1.dealAttributes.daysActive
                let deal2Arr = deal2.dealAttributes.daysActive
                let firstTrueIndex1 = deal1Arr.firstIndex(of: true) ?? deal1Arr.count
                let firstTrueIndex2 = deal2Arr.firstIndex(of: true) ?? deal2Arr.count
                
                return firstTrueIndex1 > firstTrueIndex2
            })
            
        }
            
        
        return sortedUpcomingDeals
    }
    
    func getFavoriteDeals() -> [Deal] {
        let favoriteIDArray = UserManager.shared.userDefaults.array(forKey: "userFavorites") as? [String]
        
        //print("LOG: \(String(describing: favoriteIDArray))")
        
        var favoriteDeals: [Deal] = []

        // Loop through each deal in the "deals" array
        for deal in deals {
            // Check if the deal's ID is in the "favoriteIDArray"
            if let id = favoriteIDArray, id.contains(deal.id) {
                // If the ID is in the "favoriteIDArray", add the deal to the "favoriteDeals" array
                favoriteDeals.append(deal)
            }
        }
        
        return favoriteDeals
        
    }
    
    func checkDealFavorite(deal: Deal) -> Bool {
        return getFavoriteDeals().contains(deal)
    }

}

enum FeedType {
    case DAILY
    case UPCOMING
    case FAVORITES
}

enum DailySortType{
    case DEFAULT
    case START_ASC
    case START_DEC
    case END_ASC
    case END_DEC
    case ACTIVE
    case ENDED
}

enum UpcomingSortType{
    case DAY_ASC
    case DAY_DEC
}


