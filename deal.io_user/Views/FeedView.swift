//
//  DailyFeedView.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import SwiftUI

struct DailyFeedView: View {
    @ObservedObject var feedVM = FeedViewModel()
    
    var body: some View {
        ForEach(feedVM.allDeals, id: \.self) { deal in
            DealView(deal)
        }
    }
}

struct DailyFeedView_Previews: PreviewProvider {
    static var previews: some View {
        DailyFeedView()
    }
}
