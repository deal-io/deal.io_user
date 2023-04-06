//
//  DailyFeedView.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import SwiftUI
import FirebaseAnalytics

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
                Image("dealio_white_on_bg")
                    .resizable()
                    .frame(width: 200, height: 80)
                if (viewModel.currentFeed == .UPCOMING) {
                    HStack(alignment: .center) {
                        Spacer()
                        UpcomingSortButton(viewModel: viewModel)
                        
                        Spacer()
                        HStack{
                            DailyButton(fillColor: Deal_ioColor.onBackground)
                                .onTapGesture {
                                    viewModel.currentFeed = .DAILY
                                }
                            UpcomingButton(fillColor: Deal_ioColor.selected)
                                .onTapGesture {
                                    viewModel.currentFeed = .UPCOMING
                                }.shadow(radius: 10)
                        }.background(Deal_ioColor.onBackground).cornerRadius(10)
                        
                        Spacer()
                        
                    }
                    UpcomingView(viewModel: viewModel, deals: self.upcomingDeals)
                } else {
                    HStack(alignment: .center) {
                        Spacer()
                        DailySortButton(viewModel: viewModel)
                        
                        Spacer()
                        HStack{
                            DailyButton(fillColor: Deal_ioColor.selected)
                                .onTapGesture {
                                    viewModel.currentFeed = .DAILY
                                }.shadow(radius: 10)
                            
                            UpcomingButton(fillColor: Deal_ioColor.onBackground)
                                .onTapGesture {
                                    viewModel.currentFeed = .UPCOMING
                                }
                        }.background(Deal_ioColor.onBackground).cornerRadius(10)
                        
                        Spacer()
                        
                        
                    }
                    DailyView(viewModel: viewModel, deals: self.dailyDeals)
                }
            }
        }
    }
}
