//
//  DealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

struct DealView: View {
    let deal = DealResponse.self
    let dealAttributes = DealAttributes.self
    
    @ObservedObject var feedVM = FeedViewModel()
    
    var body: some View {
        
        Text("\(dealAttributes.dealName)")
        
    }
}

struct DealView_Previews: PreviewProvider {
    static var previews: some View {
        DealView()
    }
}
