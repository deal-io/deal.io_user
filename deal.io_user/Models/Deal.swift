//
//  Deal.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/20/23.
//

import Foundation

// Codable so that it can be JSON encoded and decoded for API calls
struct DealResponse: Codable {
    
    // initialized values from database
    var dealID: String
    var restaurantID: String
    var enterDate: Date
    var dealAttributes: DealAttributes
    
}

struct DealAttributes: Codable {
    
    // initialized values from database
    var dealName: String
    var restaurantName: String
    var description: String
    var daysActive: [Bool]
    var startDate: Date
    var endDate: Date
    var recurring: Bool
    
}
