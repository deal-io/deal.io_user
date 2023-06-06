//
//  Customer.swift
//  deal.io_user
//
//  Created by Tyler Keller on 6/4/23.
//

import Foundation

struct Customer: Codable {
    
    var id: String
    var userID: String
    var token: String
    var favorites: [String]
    
}

struct Favorite: Codable {
    
    var favorite: String
    
}

struct Token: Codable {
    
    var token: String
    
}
