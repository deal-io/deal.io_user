//
//  DailyFeedView.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var feedVM: FeedViewModel
    let dailyDeals: [BasicDealViewModel]
    let upcomingDeals: [BasicDealViewModel]
    
    var body: some View {
        VStack {
            Text("deal.io")
                .font(.largeTitle)
                .foregroundColor(.white)
            HStack {
                Spacer()
                Button {
                    feedVM.currentFeed = .daily
                } label: {
                    Text("Daily")
                        .padding(5)
                        .font(.title3)
                }
                Spacer()
                Button {
                    feedVM.currentFeed = .upcoming
                } label: {
                    Text("Upcoming")
                        .padding(5)
                        .font(.title3)
                }
                .contentShape(Rectangle())
                Spacer()
            }
            if (feedVM.currentFeed == .upcoming) {
                UpcomingView(deals: upcomingDeals)
            } else {
                DailyView(deals: dailyDeals)
            }
        }
        .background(Deal_ioColor.background)
    }
}


struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(feedVM: FeedViewModel(), dailyDeals: [
            BasicDealViewModel(basicDeal: BasicDeal(
                dealName: "30% Off Specialty Burgers",
                restaurantName: "Buffalo Rose",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                hoursToEnd: 6,
                hoursToStart: 2
            )),
            BasicDealViewModel(basicDeal: BasicDeal(
                dealName: "25% Off Specialty Burgers",
                restaurantName: "Buffalo Rose",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                hoursToEnd: 6,
                hoursToStart: 2
            )),
            BasicDealViewModel(basicDeal: BasicDeal(
                dealName: "25% Off Specialty Burgers",
                restaurantName: "Buffalo Rose",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                hoursToEnd: 6,
                hoursToStart: 2
            )),
            BasicDealViewModel(basicDeal: BasicDeal(
                dealName: "25% Off Specialty Burgers",
                restaurantName: "Buffalo Rose",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                hoursToEnd: 6,
                hoursToStart: 2
            )),
        ], upcomingDeals: [
            BasicDealViewModel(basicDeal: BasicDeal(
                dealName: "25% Off Specialty Burgers",
                restaurantName: "Buffalo Rose",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                hoursToEnd: 6,
                hoursToStart: 2
            )),
            BasicDealViewModel(basicDeal: BasicDeal(
                dealName: "25% Off Specialty Burgers",
                restaurantName: "Buffalo Rose",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                hoursToEnd: 6,
                hoursToStart: 2
            )),
            BasicDealViewModel(basicDeal: BasicDeal(
                dealName: "25% Off Specialty Burgers",
                restaurantName: "Buffalo Rose",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                hoursToEnd: 6,
                hoursToStart: 2
            )),
            BasicDealViewModel(basicDeal: BasicDeal(
                dealName: "25% Off Specialty Burgers",
                restaurantName: "Buffalo Rose",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                hoursToEnd: 6,
                hoursToStart: 2
            )),
        ])
    }
}

    
