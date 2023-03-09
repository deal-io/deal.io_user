//
//  ContentView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var feedViewModel = FeedViewModel()
    
    var body: some View {
        FeedView(feedVM: feedViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
