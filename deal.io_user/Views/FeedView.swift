//
//  DailyFeedView.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel: UserViewModel
    @State var action: () -> Void = {}
    @State var disabled = false
    let dailyDeals: [Deal]
    let upcomingDeals: [Deal]
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        self.dailyDeals = viewModel.getDailyDeals()!
        self.upcomingDeals = viewModel.getUpcomingDeals()!
    }
    
    var body: some View {
        if self.viewModel.deals.isEmpty {
            VStack {
                ProgressView("Loading deals...")
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    .scaleEffect(2.0)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Deal_ioColor.background)
        } else {
            VStack {
                ZStack {
                    Image("dealio_white_on_bg")
                        .resizable()
                        .frame(width: 200, height: 80)
                    Button(action: {
                        action()
                        viewModel.clear()
                        viewModel.refresh()
                        disabled = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            disabled = false
                        }
                    }) {
                        RefreshButton()
                    }
                    .disabled(disabled)
                    .padding(.trailing, 290)
                    
                }
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
}
