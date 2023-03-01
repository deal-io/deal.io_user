//
//  DailyFeedView.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import SwiftUI

struct FeedView: View {
    
    let deals: [BasicDealViewModel]
    
    @State var isDaily = true
    
    var body: some View {
        VStack {
            Text("deal.io")
                .font(.largeTitle)
                .foregroundColor(.white)
            HStack {
                Spacer()
                Button {
                    isDaily = true
                } label: {
                    Text("Daily")
                        .padding(5)
                }
                Spacer()
                Button {
                    isDaily = false
                } label: {
                    Text("Upcoming")
                        .padding(5)
                }
                .contentShape(Rectangle())
                Spacer()
            }
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
        .background(Deal_ioColor.background)
    }
}


struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(deals: [
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

    
