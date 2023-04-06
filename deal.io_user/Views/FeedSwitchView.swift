//
//  DailyFeedView.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import SwiftUI
import FirebaseAnalytics

struct FeedSwitchView: View {
    
    @ObservedObject var viewModel: UserViewModel
    @State var action: () -> Void = {}
    @State var disabled = false
    let dailyDeals: [Deal]
    let upcomingDeals: [Deal]
    let favoriteDeals: [Deal]
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        self.dailyDeals = viewModel.getDailyDeals()!
        self.upcomingDeals = viewModel.getUpcomingDeals()!
        self.favoriteDeals = viewModel.getFavoriteDeals()
    }
    
    var body: some View {
            VStack {
                Image("dealio_white_on_bg")
                    .resizable()
                    .frame(width: 200, height: 80)
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
                        FavoritesButton(fillColor: Deal_ioColor.background)
                            .onTapGesture {
                                viewModel.currentFeed = .FAVORITES
                            }
                        Spacer()
                    }
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
                        FeedView(viewModel: viewModel, deals: self.upcomingDeals)
                    }
                } else if (viewModel.currentFeed == .FAVORITES) {
                    HStack {
                        Spacer()
                        DailyButton(fillColor: Deal_ioColor.background)
                            .onTapGesture {
                                viewModel.currentFeed = .DAILY
                            }
                        Spacer()
                        UpcomingButton(fillColor: Deal_ioColor.background)
                            .onTapGesture {
                                viewModel.currentFeed = .UPCOMING
                            }
                        Spacer()
                        FavoritesButton(fillColor: Deal_ioColor.selected)
                            .onTapGesture {
                                viewModel.currentFeed = .FAVORITES
                            }
                        Spacer()
                    }
                    FeedView(viewModel: viewModel, deals: self.favoriteDeals)
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
                        FavoritesButton(fillColor: Deal_ioColor.background)
                            .onTapGesture {
                                viewModel.currentFeed = .FAVORITES
                            }
                        Spacer()
                    }
                    FeedView(viewModel: viewModel, deals: self.dailyDeals)
                }
            }
        }
}
