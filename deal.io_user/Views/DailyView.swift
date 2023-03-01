//
//  DailyView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/28/23.
//

import SwiftUI

struct DailyView: View {
    let deals: [BasicDealViewModel]
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(self.deals, id:\.id) { deal in
                    DealView(basicDealVM: deal)
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
