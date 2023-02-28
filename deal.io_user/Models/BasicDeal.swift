//
//  BasicDeal.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/28/23.
//

import Foundation

struct BasicDeal: Hashable{
    
    var dealName: String
    var restaurantName: String
    var description: String
    var hoursToEnd: Int
    var hoursToStart: Int
    
    init(dealName: String, restaurantName: String, description: String, hoursToEnd: Int, hoursToStart: Int) {
        self.dealName = dealName
        self.restaurantName = restaurantName
        self.description = description
        self.hoursToEnd = hoursToEnd
        self.hoursToStart = hoursToStart
    }
}
