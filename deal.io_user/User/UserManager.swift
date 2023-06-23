//
//  UserState.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/28/23.
//

import Foundation
import SwiftUI
import FirebaseMessaging

class UserManager: ObservableObject {
    @ObservedObject static var shared = UserManager()
    
    var currentUser: User?
    
    private let emailKey = "userEmail"
    private let loggedInKey = "userLoggedIn"
    private let favoritesKey = "userFavorites"
    private let userIDKey = "userID"
    private let colorSchemeKey = "colorScheme"
    private let mDealService = DealService();
    
    let userDefaults = UserDefaults.standard
    
    var userID: String
    
    @Published var isLoggedIn: Bool
    @Published var colorScheme: ColorScheme {
        didSet {
            userDefaults.set(colorScheme.rawValue, forKey: colorSchemeKey)
        }
    }

    private init() {
        isLoggedIn = userDefaults.bool(forKey: loggedInKey)
    
        let storedColorScheme = userDefaults.string(forKey: colorSchemeKey) ?? "dark"
        colorScheme = ColorScheme(rawValue: storedColorScheme) ?? .dark
        userDefaults.set(storedColorScheme, forKey: colorSchemeKey)
    
        userID = userDefaults.string(forKey: userIDKey) ?? UUID().uuidString
        userDefaults.set(userID, forKey: userIDKey)
    }
    
    func checkLoginStatus() -> Bool {
        print("CLS: \(isLoggedIn)")
        return isLoggedIn
    }
    
    func setColorScheme(_ colorScheme: ColorScheme) {
        self.colorScheme = colorScheme
        userDefaults.set(colorScheme.rawValue, forKey: colorSchemeKey)
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
