//
//  DailyFeedViewModel.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    // created synthetic data to figure out view functionality
    // TODO: replace with JSON objects that pull from Firestore using the API
    // TODO: figure out what format the dates will be sent in, completely changes functionality
    @Published var currentFeed: FeedType = .DAILY
    @Published var deals: [Deal] = []
    
    private let mDealService = DealService();
    
    init() {
        getAllActiveDeals()
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
    
    func getDailyDeals() -> [Deal]?{
        //TODO
        return nil;
    }
    
    func getUpcomingDeals() -> [Deal]?{
        //TODO
        return nil;
    }
}

enum FeedType {
    case DAILY
    case UPCOMING
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

