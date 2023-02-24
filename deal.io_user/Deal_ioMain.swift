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
            DailyFeedView()
        }
    }
}
