//
//  DailyFeedView.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel: UserViewModel
    let dailyDeals: [Deal]
    let upcomingDeals: [Deal]
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        self.dailyDeals = viewModel.getDailyDeals()!
        self.upcomingDeals = viewModel.getUpcomingDeals()!
    }
    
    var body: some View {
        VStack {
            Image("dealio_white_on_bg")
                .resizable()
                .frame(width: 200, height: 90)
            if (viewModel.currentFeed == .UPCOMING) {
                HStack {
                    Spacer()
                    DailyButton(fillColor: Deal_ioColor.background)
                        .onTapGesture {
                            viewModel.currentFeed = .DAILY
                        }
                    Spacer()
                    UpcomingButton(fillColor: Deal_ioColor.selected)
                        .onTapGesture {
                            viewModel.currentFeed = .UPCOMING
                        }
                    Spacer()
                }
                UpcomingView(viewModel: viewModel, deals: self.upcomingDeals)
            } else {
                HStack {
                    Spacer()
                    DailyButton(fillColor: Deal_ioColor.selected)
                        .onTapGesture {
                            viewModel.currentFeed = .DAILY
                        }
                    Spacer()
                    UpcomingButton(fillColor: Deal_ioColor.background)
                        .onTapGesture {
                            viewModel.currentFeed = .UPCOMING
                        }
                    Spacer()
                }
                DailyView(viewModel: viewModel, deals: self.dailyDeals)
            }
        }
        .background(Deal_ioColor.background)
    }
}
