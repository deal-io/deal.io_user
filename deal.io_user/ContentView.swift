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
    @ObservedObject var viewModel = UserViewModel()
    @State var isLoggedIn = UserManager.shared.isLoggedIn

    var body: some View {
        Group {
            if isLoggedIn {
                FeedView(viewModel: viewModel)
            } else {
                WelcomeView(viewModel: viewModel, onLogin: { self.isLoggedIn = true })
            }
        }
        .background(Deal_ioColor.background)
    }
    
                
        
}
