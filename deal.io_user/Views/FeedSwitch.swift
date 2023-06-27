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
    
    @State private var selectedFeed = FeedType.Daily

    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        self.dailyDeals = viewModel.getDailyDeals()!
        self.upcomingDeals = viewModel.getUpcomingDeals()!
        self.everydayDeals = viewModel.getEverydayDeals()!
    }
    
    var body: some View {
        VStack {
            Image(Deal_ioColor.dealio_logo(for: userManager.colorScheme))
                .resizable()
                .frame(width: 200, height: 80)
            VStack {
                HStack(alignment: .center) {
                    UpcomingSortButton(viewModel: viewModel)
                        .padding(.leading, 30)
                    Spacer()
                    Menu {
                        Picker("Feed", selection: $selectedFeed) {
                            ForEach(FeedType.allCases) { feedType in
                                Text(feedType.rawValue).tag(feedType)
                            }
                        }
                    } label: {
                        HStack {
                            Text(selectedFeed.rawValue)
                                .font(.title)
                                .bold()
                                .padding(.vertical, 5)
                                .padding(.leading, 10)
                            Image(systemName: "chevron.down")
                                .padding(.vertical, 5)
                                .padding(.trailing, 10)
                        }
                        .foregroundColor(Deal_ioColor.text(for: userManager.colorScheme))
                        .background(Deal_ioColor.onBackground(for: UserManager.shared.colorScheme))
                        .cornerRadius(10)
                        .fixedSize()
                    }
                    .onChange(of: selectedFeed) { newValue in
                        viewModel.currentFeed = newValue
                    }
                    .padding(.trailing, 50)
                }
                switch viewModel.currentFeed {
                case .Daily:
                    FeedView(viewModel: viewModel, deals: self.dailyDeals, upcoming: false)
                case .Weekly:
                    FeedView(viewModel: viewModel, deals: self.upcomingDeals, upcoming: true)
                case .Everyday:
                    FeedView(viewModel: viewModel, deals: self.everydayDeals, upcoming: false)
                }
                Rectangle()
                    .foregroundColor(Deal_ioColor.background(for: UserManager.shared.colorScheme))
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: 200, height: 5)
            }
        }
    }
}
