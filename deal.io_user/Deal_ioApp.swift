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
    
    @ObservedObject private var feedVM = FeedViewModel()
    
    var body: some Scene {
        WindowGroup {
            DailyFeedView(deals: self.feedVM.allDealViewModels)
        }
    }
}
