//
//  Deal.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/20/23.
//

import Foundation
import FirebaseFirestore

// Codable so that it can be JSON encoded and decoded for API calls
//struct Deal: Codable, Hashable {
//
//    // initialized values from database
//    var id: String
//    var restaurantID: String
//    var enterDate: BackendDate
//    var dealAttributes: DealAttributes
//
//    init(id: String, restaurantID: String, enterDate: BackendDate, dealAttributes: DealAttributes) {
//
//        self.id = id
//        self.restaurantID = restaurantID
//        self.enterDate = enterDate
//        self.dealAttributes = dealAttributes
//
//    }
//}
//
//extension Deal {
//
//    var hash: Int {
//        return (id+restaurantID).hashValue
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//        hasher.combine(restaurantID)
//    }
//
//    static func == (lhs: Deal, rhs: Deal) -> Bool {
//        return lhs.id == rhs.id && lhs.restaurantID == rhs.restaurantID
//    }
//}
//
//struct DealAttributes: Codable {
//
//    // initialized values from database
//    var dealName: String
//    var description: String
//    var daysActive: [Bool]
//    var startDate: BackendDate
//    var endDate: BackendDate
//    var recurring: Bool
//
//    init(dealName: String, description: String, daysActive: [Bool], startDate: BackendDate, endDate: BackendDate, recurring: Bool) {
//
//        self.dealName = dealName
//        self.description = description
//        self.daysActive = daysActive
//        self.startDate = startDate
//        self.endDate = endDate
//        self.recurring = recurring
//
//    }
//}
//
//struct BackendDate: Codable {
//
//    // giving the backend seconds and nanoseconds for each date
//    var _seconds: Double
//    var _nanoseconds: Double
//}
//

struct Deal: Codable {
    let id: String
    let restaurantID: String
    let enterDate: DateVal
    let dealAttributes: DealAttributes
}

struct DateVal: Codable {
    let seconds: Int64
    let nanoseconds: Int64
}

struct DealAttributes: Codable {
    let daysActive: [Bool]
    let dealName: String
    let description: String
    let startDate: DateVal
    let endDate: DateVal
    let recurring: Bool
}
