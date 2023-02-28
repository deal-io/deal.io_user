//
//  Deal.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/20/23.
//

import Foundation

// Codable so that it can be JSON encoded and decoded for API calls
struct DealResponse: Codable, Hashable {
    
    // initialized values from database
    var dealID: String
    var restaurantID: String
    var enterDate: String
    var dealAttributes: DealAttributes
    
    init(dealID: String, restaurantID: String, enterDate: String, dealAttributes: DealAttributes) {
        
        self.dealID = dealID
        self.restaurantID = restaurantID
        self.enterDate = enterDate
        self.dealAttributes = dealAttributes
        
    }
}

extension DealResponse {
    
    var hash: Int {
        return (dealID+restaurantID+enterDate).hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(dealID)
        hasher.combine(restaurantID)
        hasher.combine(enterDate)
    }
    
    static func == (lhs: DealResponse, rhs: DealResponse) -> Bool {
        lhs.dealID == rhs.dealID && lhs.restaurantID == rhs.restaurantID && lhs.enterDate == rhs.enterDate
    }
}

struct DealAttributes: Codable {
    
    // initialized values from database
    var dealName: String
    var restaurantName: String
    var description: String
    var daysActive: [Bool]
    var startDate: String
    var endDate: String
    var recurring: Bool
    
    init(dealName: String, restaurantName: String, description: String, daysActive: [Bool], startDate: String, endDate: String, recurring: Bool) {
        
        self.dealName = dealName
        self.restaurantName = restaurantName
        self.description = description
        self.daysActive = daysActive
        self.startDate = startDate
        self.endDate = endDate
        self.recurring = recurring
        
    }
}
