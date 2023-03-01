//
//  main.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/23/23.
//

import Foundation
import SwiftUI

@main
struct Deal_io: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            FeedView(feedVM: FeedViewModel(), dailyDeals: [
                BasicDealViewModel(basicDeal: BasicDeal(
                    dealName: "25% Off Specialty Burgers",
                    restaurantName: "Buffalo Rose",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                    hoursToEnd: 6,
                    hoursToStart: 2
                ))
            ], upcomingDeals: [
                BasicDealViewModel(basicDeal: BasicDeal(
                    dealName: "25% Off Specialty Burgers",
                    restaurantName: "Buffalo Rose",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                    hoursToEnd: 6,
                    hoursToStart: 2
                ))
            ])
        }
    }
}
