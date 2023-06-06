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
    private let userIDKey = "userID"
    let userDefaults = UserDefaults.standard
    private let mDealService = DealService();
    
    @Published var isLoggedIn: Bool
    var userID: String
    
    private init() {
        isLoggedIn = userDefaults.bool(forKey: loggedInKey)
        userID = userDefaults.string(forKey: userIDKey) ?? UUID().uuidString
        userDefaults.set(userID, forKey: userIDKey)
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
        // Get the existing favorites array from user defaults
        var favorites = userDefaults.array(forKey: favoritesKey) as? [String] ?? []
        // Make call to backend to update the user's favorites array in db
        // Append the new deal ID to the favorites array on successful backend update
        mDealService.addFavorite(favorite: Favorite(favorite: dealID)) { result in
            switch result {
            case .success():
                favorites.append(dealID)
                print("Favorite successfully added.")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        // Save the updated favorites array to user defaults
        userDefaults.set(favorites, forKey: favoritesKey)
        //print("LOG Array \(String(describing: userDefaults.array(forKey: favoritesKey)))")
    }

    
    func removeFavorite(dealID: String) {
        //print("LOG RemoveID: \(dealID)")
        var favorites = userDefaults.array(forKey: favoritesKey) as? [String] ?? []

        mDealService.removeFavorite(favorite: Favorite(favorite: dealID)) { result in
            switch result {
            case .success():
                while let index = favorites.firstIndex(of: dealID) {
                    favorites.remove(at: index)
                }
                print("Favorite successfully removed.")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
        userDefaults.set(favorites, forKey: favoritesKey)
        //print("LOG Array \(String(describing: userDefaults.array(forKey: favoritesKey)))")
    }

    
}
