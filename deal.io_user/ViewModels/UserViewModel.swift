//
//  DailyFeedViewModel.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import Foundation

class UserViewModel: ObservableObject {
    // created synthetic data to figure out view functionality
    // TODO: replace with JSON objects that pull from Firestore using the API
    // TODO: figure out what format the dates will be sent in, completely changes functionality
    @Published var currentFeed: FeedType = .DAILY
    @Published var deals: [Deal] = []
    @Published var restaurants: [Restaurant] = []
    @Published var nameMap = [String: String]()
    @Published var locationMap = [String: String]()
    
    private let mDealService = DealService();
    
    // TODO: guessing that the getAll's aren't completing before restaurant's loop
    init() {
        self.getAllActiveDeals()
        self.getAllRestaurants()
    }
    
    func getAllActiveDeals() {
        mDealService.fetchDeals { result in
            switch result {
            case .success(let deals):
                print("Deals: \(deals)")
                self.deals = deals;
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
                self.restaurants = restaurants;
                for restaurant in self.restaurants {
                    self.nameMap[restaurant.id] = restaurant.name
                    self.locationMap[restaurant.id] = restaurant.location
                }
            case .failure(let error):
                //TODO handle error
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getDailyDeals() -> [Deal]?{
        var dailyDeals: [Deal] = []
        for deal in deals {
            if deal.dealAttributes.daysActive[0] {
                dailyDeals.append(deal)
            }
        }
        return dailyDeals
    }
    
    func getUpcomingDeals() -> [Deal]?{
        var upcomingDeals: [Deal] = []
        for deal in deals {
            if (deal.dealAttributes.daysActive[1...6].contains(true) && !(deal.dealAttributes.daysActive[0])) {
                upcomingDeals.append(deal)
            }
        }
        return upcomingDeals
    }
}

enum FeedType {
    case DAILY
    case UPCOMING
}
