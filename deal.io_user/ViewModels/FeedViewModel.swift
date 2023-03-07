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
    @Published var currentFeed: FeedType = .daily
    @Published var deals = [FeedViewModel]()
    
   /*
    init() {
        fetchDeals()
    }
    func fetchDeals() {
        DealService().getAllActiveDeals() { deals in
            if let deals = deals {
                self.deals = deals.map(DealViewModel.init)
            }
        }
    }
    */
}

enum FeedType {
    case daily
    case upcoming
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

