//
//  DailyFeedView.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import SwiftUI

struct DailyFeedView: View {
    
    let deals: [BasicDealViewModel]
    
    @State var isOn = true
    
    var body: some View {
        VStack {
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
}


struct DailyFeedView_Previews: PreviewProvider {
    static var previews: some View {
        DailyFeedView(deals: [
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

    
