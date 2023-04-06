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
    
    func addFavorite(dealID: String) {
        print("LOG AddID: \(dealID)")
        // Get the existing favorites array from user defaults
        var favorites = userDefaults.array(forKey: favoritesKey) as? [String] ?? []
        // Append the new deal ID to the favorites array
        favorites.append(dealID)
        // Save the updated favorites array to user defaults
        userDefaults.set(favorites, forKey: favoritesKey)
        print("LOG Array \(String(describing: userDefaults.array(forKey: favoritesKey)))")
        
    }

    
    func removeFavorite(dealID: String) {
        print("LOG RemoveID: \(dealID)")
        var favorites = userDefaults.array(forKey: favoritesKey) as? [String] ?? []

        while let index = favorites.firstIndex(of: dealID) {
            favorites.remove(at: index)
        }
        
        userDefaults.set(favorites, forKey: favoritesKey)
        print("LOG Array \(String(describing: userDefaults.array(forKey: favoritesKey)))")
    }

    
}
