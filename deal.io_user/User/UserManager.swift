//
//  UserState.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/28/23.
//

import Foundation
import SwiftUI
import FirebaseMessaging

class UserManager {
    static let shared = UserManager()
    
    var currentUser: User?
    
    private let emailKey = "userEmail"
    private let loggedInKey = "userLoggedIn"
    private let favoritesKey = "userFavorites"
    private let userIDKey = "userID"
    private let colorSchemeKey = "colorScheme"
    let userDefaults = UserDefaults.standard
    private let mDealService = DealService();
    
    @Published var isLoggedIn: Bool
    var userID: String
    var colorScheme: String
    
    private init() {
        isLoggedIn = userDefaults.bool(forKey: loggedInKey)
        userID = userDefaults.string(forKey: userIDKey) ?? UUID().uuidString
        colorScheme = userDefaults.string(forKey: colorSchemeKey) ?? "DARK"
        userDefaults.set(userID, forKey: userIDKey)
        userDefaults.set(colorScheme, forKey: colorSchemeKey)
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
        
        favorites.append(dealID)
        // Save the updated favorites array to user defaults
        userDefaults.set(favorites, forKey: favoritesKey)
        //print("LOG Array \(String(describing: userDefaults.array(forKey: favoritesKey)))")
        // Check if user has allowed notifications
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { (settings) in
            print("FAVORITES_SUBSCRIPTION: Notification settings: \(settings)")
            if settings.authorizationStatus == .authorized {
                // The user has allowed notifications, subscribe them to the dealID topic
                Messaging.messaging().subscribe(toTopic: dealID)
            }
        }
    }

    
    func removeFavorite(dealID: String) {
        //print("LOG RemoveID: \(dealID)")
        var favorites = userDefaults.array(forKey: favoritesKey) as? [String] ?? []

        while let index = favorites.firstIndex(of: dealID) {
            favorites.remove(at: index)
        }
        
        userDefaults.set(favorites, forKey: favoritesKey)
        //print("LOG Array \(String(describing: userDefaults.array(forKey: favoritesKey)))")
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { (settings) in
            print("FAVORITES_SUBSCRIPTION: Notification settings: \(settings)")
            if settings.authorizationStatus == .authorized {
                // The user has allowed notifications, subscribe them to the dealID topic
                Messaging.messaging().unsubscribe(fromTopic: dealID)
            }
        }
    }
}
