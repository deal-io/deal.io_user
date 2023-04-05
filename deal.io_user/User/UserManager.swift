//
//  UserState.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/28/23.
//

import Foundation
import SwiftUI

class UserManager {
    static let shared = UserManager()
    
    var currentUser: User?
    
    private let emailKey = "userEmail"
    private let loggedInKey = "userLoggedIn"
    private let favoritesKey = "userFavorites"
    let userDefaults = UserDefaults.standard
    
    @Published var isLoggedIn: Bool
    
    private init() {
        isLoggedIn = userDefaults.bool(forKey: loggedInKey)
    }
    
    func checkLoginStatus() -> Bool {
        print("CLS: \(isLoggedIn)")
        return isLoggedIn
    }
    
    func login(email: String) {
        currentUser = User(email: email)
        userDefaults.set(email, forKey: emailKey)
        userDefaults.set(true, forKey: loggedInKey)
        isLoggedIn = true
        print("UM: \(userDefaults.bool(forKey: loggedInKey))")
    }
    
    func logout() {
        currentUser = nil
        userDefaults.set(false, forKey: loggedInKey)
        isLoggedIn = false
        print("UM: \(userDefaults.bool(forKey: loggedInKey))")
    }
}
