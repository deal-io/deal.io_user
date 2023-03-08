//
//  DailyView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/28/23.
//

import SwiftUI

struct DailyView(feedViewModel: FeedViewModel): View {
    let deals = feedViewModel.getDailyDeals()
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(self.deals, id:\.id) { deal in
                    DealView(dealVM: deal)
                }
            }
        }
        .background(Deal_ioColor.background)
        .listRowSeparator(.hidden)
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView(deals: [
            DealViewModel(deal: Deal(
                dealID: "912ec803b2ce49e4a541068d495ab570",
                restaurantID: "81dc9bdb52d04dc20036dbd8313ed055",
                enterDate: BackendDate(seconds: 1, nanoseconds: 1),
                dealAttributes: DealAttributes(
                    dealName: "25% Off Specialty Burgers",
                    restaurantName: "Buffalo Rose",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                    daysActive: [false, true, false, false, false, false, false],
                    startDate: BackendDate(seconds: 112384761, nanoseconds: 1),
                    endDate: BackendDate(seconds: 1098213498, nanoseconds: 1),
                    recurring: true
                )
            )),
            DealViewModel(deal: Deal(
                dealID: "912ec803b2ce49e4a541068d495ab570",
                restaurantID: "81dc9bdb52d04dc20036dbd8313ed055",
                enterDate: BackendDate(seconds: 1, nanoseconds: 1),
                dealAttributes: DealAttributes(
                    dealName: "25% Off Specialty Burgers",
                    restaurantName: "Buffalo Rose",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                    daysActive: [false, true, false, false, false, false, false],
                    startDate: BackendDate(seconds: 1128374623, nanoseconds: 1),
                    endDate: BackendDate(seconds: 1123874691234, nanoseconds: 1),
                    recurring: true
                )
            )),
            DealViewModel(deal: Deal(
                dealID: "912ec803b2ce49e4a541068d495ab570",
                restaurantID: "81dc9bdb52d04dc20036dbd8313ed055",
                enterDate: BackendDate(seconds: 1, nanoseconds: 1),
                dealAttributes: DealAttributes(
                    dealName: "25% Off Specialty Burgers",
                    restaurantName: "Buffalo Rose",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                    daysActive: [false, true, false, false, false, false, false],
                    startDate: BackendDate(seconds: 1, nanoseconds: 1),
                    endDate: BackendDate(seconds: 112384762314, nanoseconds: 1),
                    recurring: true
                )
            )),
            DealViewModel(deal: Deal(
                dealID: "912ec803b2ce49e4a541068d495ab570",
                restaurantID: "81dc9bdb52d04dc20036dbd8313ed055",
                enterDate: BackendDate(seconds: 1, nanoseconds: 1),
                dealAttributes: DealAttributes(
                    dealName: "25% Off Specialty Burgers",
                    restaurantName: "Buffalo Rose",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                    daysActive: [false, true, false, false, false, false, false],
                    startDate: BackendDate(seconds: 1237846234, nanoseconds: 1),
                    endDate: BackendDate(seconds: 11238476324, nanoseconds: 1),
                    recurring: true
                )
            )),
        ])
    }
}
