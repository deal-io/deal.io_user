//
//  main.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/23/23.
//

import Foundation
import SwiftUI
import Firebase
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
        
        // prompts the user to update everytime they open it
        siren.rulesManager = RulesManager(globalRules: .annoying)
        
        // FORCES the user to update before they can use it
        // siren.rulesManager = RulesManager(globalRules: .critical)
        
        // Major, Minor, Patch, and Revision custom rules
        /* siren.rulesManager = RulesManager(majorUpdateRules: .critical,
                                              minorUpdateRules: .annoying,
                                              patchUpdateRules: .default,
                                              revisionUpdateRules: Rules(promptFrequency: .weekly, forAlertType: .option))
        */
        
        // custom color and text
        siren.presentationManager = PresentationManager(appName: "deal.io",
                                                        alertTitle: "Update",
                                                        skipButtonTitle: "Skip")
        
        
        siren.wail()

        FirebaseApp.configure()
        
        return true
    }
}
