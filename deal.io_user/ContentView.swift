//
//  ContentView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/1/23.
//

import SwiftUI
import Firebase
import FirebaseAnalytics
import Updates

struct ContentView: View {
    @ObservedObject var viewModel = UserViewModel()
    @State var isLoggedIn = UserManager.shared.isLoggedIn
    
    @State private var selection: Int = 0

    var body: some View {
        Group {
            if isLoggedIn {
                TabView(selection: $selection) {
                    FeedSwitch(viewModel: viewModel)
                        .background(Deal_ioColor.background)
                        .tabItem {
                            Image(systemName: "list.dash")
                            Text("Feed")
                        }
                        .tag(0)
                        .toolbarBackground(
                            Deal_ioColor.tabColor,
                            for: .tabBar)
                    Favorites(viewModel: viewModel)
                        .background(Deal_ioColor.background)
                        .tabItem {
                            Image(systemName: "star.fill")
                            Text("Favorites")
                        }
                        .tag(1)
                        .toolbarBackground(
                                Deal_ioColor.tabColor,
                                for: .tabBar)
                }
                .overlay(HelpButton(), alignment: .topTrailing)
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
        .background(Deal_ioColor.background)
    }
}


   

