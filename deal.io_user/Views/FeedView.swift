//
//  DailyFeedView.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var feedVM: FeedViewModel
    let dailyDeals: [Deal]
    let upcomingDeals: [Deal]
    
    init(feedVM: FeedViewModel) {
        self.feedVM = feedVM
        self.dailyDeals = feedVM.getDailyDeals()!
        self.upcomingDeals = feedVM.getUpcomingDeals()!
    }
    
    var body: some View {
        VStack {
            Image("dealio_white_on_bg")
                .resizable()
                .frame(width: 200, height: 90)
            HStack {
                Spacer()
                Button {
                    feedVM.currentFeed = .DAILY
                } label: {
                    Text("Daily")
                        .padding(5)
                        .font(.title3)
                }
                Spacer()
                Button {
                    feedVM.currentFeed = .UPCOMING
                } label: {
                    Text("Upcoming")
                        .padding(5)
                        .font(.title3)
                }
                .contentShape(Rectangle())
                Spacer()
            }
            if (feedVM.currentFeed == .UPCOMING) {
                UpcomingView(deals: self.upcomingDeals)
            } else {
                DailyView(deals: self.dailyDeals)
            }
        }
        .background(Deal_ioColor.background)
    }
}
