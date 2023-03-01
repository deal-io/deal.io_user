//
//  DealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

struct DealView: View {
    @ObservedObject var basicDealVM: BasicDealViewModel
    @State private var expanded = false

    
    var body: some View {
            VStack {
                if expanded {
                    ExpandedDealView(basicDealVM: basicDealVM)
                } else {
                    ContractedDealView(basicDealVM: basicDealVM)
                }
            }
            .onTapGesture {
                withAnimation {
                    expanded.toggle()
            }
        }
    }
}

struct DealView_Previews: PreviewProvider {
    static var previews: some View {
        DealView(basicDealVM: BasicDealViewModel(basicDeal: BasicDeal(
            dealName: "25% Off Specialty Burgers",
            restaurantName: "Buffalo Rose",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
            hoursToEnd: 6,
            hoursToStart: 2
        )
        )
        )
    }
}
