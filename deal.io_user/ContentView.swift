//
//  ContentView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/1/23.
//

import SwiftUI
import Firebase
import FirebaseAnalytics

struct ContentView: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel = UserViewModel()
    @State var isLoggedIn = UserManager.shared.isLoggedIn
    
    @State private var selection: Int = 0

    var body: some View {
        Group {
            if isLoggedIn {
                TabView(selection: $selection) {
                    FeedSwitch(viewModel: viewModel)
                        .background(Deal_ioColor.background(for: UserManager.shared.colorScheme))
                        .tabItem {
                            Image(systemName: "list.dash")
                            Text("Feed")
                        }
                        .tag(0)
                    Favorites(viewModel: viewModel)
                        .background(Deal_ioColor.background(for: UserManager.shared.colorScheme))
                        .tabItem {
                            Image(systemName: "star.fill")
                            Text("Favorites")
                        }
                        .tag(1)
                }
                .preferredColorScheme(userManager.colorScheme == .light ? .light : .dark)
                .overlay(HelpButton(), alignment: .topTrailing)
                .overlay(LightDarkModeButton(), alignment: .topLeading)
                // binds TabView id to tabSelection, on change, refreshes entire TabView
                .id(viewModel.tabSelection)
                .onChange(of: selection) { newValue in
                    print("Change")
                    viewModel.tabSelection = newValue
                }
            } else {
                Welcome(viewModel: viewModel, onLogin: { self.isLoggedIn = true })
            }
        }
        .background(Deal_ioColor.background(for: UserManager.shared.colorScheme))
    }
}


   

