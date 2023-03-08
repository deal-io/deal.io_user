//
//  ContentView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    
    //TODO drill view model down for use in the views
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
