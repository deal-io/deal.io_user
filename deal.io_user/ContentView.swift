//
//  ContentView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var feedViewModel = FeedViewModel()
    
    /*
     TODO: build in a persistent boolean flag and string email
     send them to FeedView if flag is true and they've sent in an email
     else, send to WelcomeView
     */
    var body: some View {
        FeedView(feedVM: feedViewModel)
    }
}
