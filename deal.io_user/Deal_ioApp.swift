//
//  main.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/23/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseMessaging
import Siren

@main
struct Deal_io: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.makeKeyAndVisible()
        let siren = Siren.shared
        siren.rulesManager = RulesManager(globalRules: .critical)
        siren.presentationManager = PresentationManager(appName: "deal.io", alertTitle: "Update", skipButtonTitle: "Skip")
        siren.wail()
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken

        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching FCM registration token: \(error)")
            } else if let token = token {
                print("FCM registration token: \(token)")
            }
        }
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for remote notifications with error: \(error)")
    }
}
