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
    @Published var dailySortType: DailySortType = .NONE
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
     daily requires that daysActive[0] is true and not all daysActive are true
     */
    func getDailyDeals() -> [Deal]? {
       // print("\(LOG_TAG) Daily Deals \(dailySortType)")
        var sortedDeals: [Deal] = []
        
        
        for deal in deals {
            if (deal.dealAttributes.daysActive[0] && !(deal.dealAttributes.daysActive.allSatisfy { $0 == true })) {
                sortedDeals.append(deal)
            }
        }
        
        var activeDeals: [Deal] =  sortedDeals.filter({DateUtil().checkDealActive(deal: $0)})
        var upcomingDeals: [Deal] = sortedDeals.filter({DateUtil().checkDealDailyUpcoming(deal: $0)})
        var endedDeals: [Deal] = sortedDeals.filter({DateUtil().checkDealEnded(deal: $0)})
        

        switch dailySortType {
            // ACTIVE -> Sort by end time
            // UPCOMING -> Sort by start time
            // ENDED -> Dump ended
        case .NONE:
            
            activeDeals = activeDeals.sorted(by: { deal1, deal2 in
                let hourDifference = DateUtil().getHourDifference(hourOne: deal1.dealAttributes.endTime, hourTwo: deal2.dealAttributes.endTime)

               return hourDifference < 0
            })
          
           
            upcomingDeals = upcomingDeals.sorted(by: { deal1, deal2 in
                let hourDifference = DateUtil().getHourDifference(hourOne: deal1.dealAttributes.startTime, hourTwo: deal2.dealAttributes.startTime)

               return hourDifference < 0
            })
            
            
            sortedDeals = activeDeals + upcomingDeals + endedDeals
            
        
        case .ACTIVE:
            activeDeals = activeDeals.sorted { (deal1, deal2) -> Bool in
                // Compare the DealEnded attribute
                let hourDifference = DateUtil().getHourDifference(hourOne: deal1.dealAttributes.endTime, hourTwo: deal2.dealAttributes.endTime)

               return hourDifference < 0
            }
            
            sortedDeals = activeDeals
        case .ENDED:
            sortedDeals = endedDeals
        case .UPCOMING:
            upcomingDeals = upcomingDeals.sorted(by: { deal1, deal2 in
                let hourDifference = DateUtil().getHourDifference(hourOne: deal1.dealAttributes.startTime, hourTwo: deal2.dealAttributes.startTime)

               return hourDifference < 0
            })
            sortedDeals = upcomingDeals
        }

        return sortedDeals
    }
    
    /*
     everyday requires that all of daysActive is true
     */
    func getEverydayDeals() -> [Deal]? {
        var sortedDeals: [Deal] = []
        
        for deal in deals {
            if (deal.dealAttributes.daysActive.allSatisfy { $0 == true}) {
                sortedDeals.append(deal)
            }
        }
        
        var activeDeals: [Deal] =  sortedDeals.filter({DateUtil().checkDealActive(deal: $0)})
        var upcomingDeals: [Deal] = sortedDeals.filter({DateUtil().checkDealDailyUpcoming(deal: $0)})
        var endedDeals: [Deal] = sortedDeals.filter({DateUtil().checkDealEnded(deal: $0)})
        

        switch dailySortType {
            // ACTIVE -> Sort by end time
            // UPCOMING -> Sort by start time
            // ENDED -> Dump ended
        case .NONE:
            
            activeDeals = activeDeals.sorted(by: { deal1, deal2 in
                let hourDifference = DateUtil().getHourDifference(hourOne: deal1.dealAttributes.endTime, hourTwo: deal2.dealAttributes.endTime)

               return hourDifference < 0
            })
          
           
            upcomingDeals = upcomingDeals.sorted(by: { deal1, deal2 in
                let hourDifference = DateUtil().getHourDifference(hourOne: deal1.dealAttributes.startTime, hourTwo: deal2.dealAttributes.startTime)

               return hourDifference < 0
            })
            
            
            sortedDeals = activeDeals + upcomingDeals + endedDeals
            
        
        case .ACTIVE:
            activeDeals = activeDeals.sorted { (deal1, deal2) -> Bool in
                // Compare the DealEnded attribute
                let hourDifference = DateUtil().getHourDifference(hourOne: deal1.dealAttributes.endTime, hourTwo: deal2.dealAttributes.endTime)

               return hourDifference < 0
            }
            
            sortedDeals = activeDeals
        case .ENDED:
            sortedDeals = endedDeals
        case .UPCOMING:
            upcomingDeals = upcomingDeals.sorted(by: { deal1, deal2 in
                let hourDifference = DateUtil().getHourDifference(hourOne: deal1.dealAttributes.startTime, hourTwo: deal2.dealAttributes.startTime)

               return hourDifference < 0
            })
            sortedDeals = upcomingDeals
        }

        return sortedDeals
    }

    
    /*
     upcoming requires that any of the daysActive are true or if daysActive[0] is true, then CurrentTime - StartTime is positive
     */
    func getUpcomingDeals() -> [Deal]?{
       // print("\(LOG_TAG) Upcoming Deals \(upcomingSortType)")
        var sortedUpcomingDeals: [Deal] = []
        for deal in deals {
            if (deal.dealAttributes.daysActive[1...6].contains(true)) {
                sortedUpcomingDeals.append(deal)
            }
        }

        
        switch upcomingSortType {
    
        case .DAY_ASC:
            sortedUpcomingDeals.sort(by: { (deal1, deal2) -> Bool in
                let deal1Arr = deal1.dealAttributes.daysActive.dropFirst()
                let deal2Arr = deal2.dealAttributes.daysActive.dropFirst()
                let firstTrueIndex1 = deal1Arr.firstIndex(of: true) ?? deal1Arr.count
                let firstTrueIndex2 = deal2Arr.firstIndex(of: true) ?? deal2Arr.count
                
                return firstTrueIndex1 < firstTrueIndex2
            })
            
        case .DAY_DEC:
            sortedUpcomingDeals.sort(by: { (deal1, deal2) -> Bool in
                let deal1Arr = deal1.dealAttributes.daysActive
                let deal2Arr = deal2.dealAttributes.daysActive
                let lastTrueIndex1 = deal1Arr.lastIndex(of: true) ?? deal1Arr.count
                let lastTrueIndex2 = deal2Arr.lastIndex(of: true) ?? deal2Arr.count
                
                return lastTrueIndex1 > lastTrueIndex2
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
    case EVERYDAY
}

enum DailySortType{
    case NONE
    case ACTIVE
    case UPCOMING
    case ENDED
}

enum UpcomingSortType{
    case DAY_ASC
    case DAY_DEC
}


