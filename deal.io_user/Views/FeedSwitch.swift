//
//  DailyFeedView.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import SwiftUI
import FirebaseAnalytics

struct FeedSwitch: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel: UserViewModel
    @State var action: () -> Void = {}
    @State var disabled = false
    let dailyDeals: [Deal]
    let upcomingDeals: [Deal]
    let everydayDeals: [Deal]
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        self.dailyDeals = viewModel.getDailyDeals()!
        self.upcomingDeals = viewModel.getUpcomingDeals()!
        self.everydayDeals = viewModel.getEverydayDeals()!
    }
    
    var body: some View {
        VStack {
            Image("dealio_white_on_bg")
                .resizable()
                .frame(width: 200, height: 80)
            VStack {
                HStack(alignment: .center) {
                    Spacer()
                    UpcomingSortButton(viewModel: viewModel)
                    Spacer()
                    HStack{
                        DailyButton(viewModel: viewModel)
                            .onTapGesture {
                                viewModel.currentFeed = .DAILY
                            }
                        UpcomingButton(viewModel: viewModel)
                            .onTapGesture {
                                viewModel.currentFeed = .UPCOMING
                            }.shadow(radius: 10)
                    }.background(Deal_ioColor.onBackground(for: UserManager.shared.colorScheme)).cornerRadius(10)
                    Spacer()
                }
                if (viewModel.currentFeed == .UPCOMING) {
                    FeedView(viewModel: viewModel, deals: self.upcomingDeals, upcoming: true)
                } else {
                    FeedView(viewModel: viewModel, deals: self.dailyDeals, upcoming: false)
                }
                Rectangle()
                    .foregroundColor(Deal_ioColor.background(for: UserManager.shared.colorScheme))
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: 200, height: 5)
            }
        }
    }
}
