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
    @Published var currentFeed: FeedType = .DAILY
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
        mDealService.fetchDeals { result in
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
    func getDailyDeals() -> [Deal]?{
        var dailyDeals: [Deal] = []
        for deal in deals {
            if deal.dealAttributes.daysActive[0] {
                dailyDeals.append(deal)
            }
        }
        
        // below sorts
        var sortedDailyDeals: [Deal] = []
        for deal in dailyDeals {
            if DateUtil().getHourDifference(inputHour: deal.dealAttributes.endTime) > 0 {
                sortedDailyDeals.append(deal)
            }
        }
        for deal in dailyDeals {
            if !sortedDailyDeals.contains(where: { $0.id == deal.id }) {
                sortedDailyDeals.append(deal)
            }
        }
        return sortedDailyDeals
    }
    
    /*
     upcoming requires that any of the daysActive are true or if daysActive[0] is true, then CurrentTime - StartTime is positive
     */
    func getUpcomingDeals() -> [Deal]?{
        var upcomingDeals: [Deal] = []
        for deal in deals {
            if ((deal.dealAttributes.daysActive[1...6].contains(true) && !deal.dealAttributes.daysActive[0]) || (deal.dealAttributes.daysActive[0] && (DateUtil().getHourDifference(inputHour: deal.dealAttributes.startTime) > 0))) {
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
        
        return sortedUpcomingDeals
    }
    
    func getFavoriteDeals() -> [Deal]? {
        return UserManager.shared.userDefaults.array(forKey: "userFavorites") as? [Deal]
    }

}

enum FeedType {
    case DAILY
    case UPCOMING
    case FAVORITES
}

