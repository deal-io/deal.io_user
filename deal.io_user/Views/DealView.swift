//
//  DealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

struct DealView: View {
    @ObservedObject var dealVM: DealViewModel
    @State private var expanded = false

    
    var body: some View {
            VStack {
                if expanded {
                    ExpandedDealView(dealVM: dealVM)
                } else {
                    ContractedDealView(dealVM: dealVM)
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
        DealView(dealVM: DealViewModel(deal: Deal(
            dealID: "912ec803b2ce49e4a541068d495ab570",
            restaurantID: "81dc9bdb52d04dc20036dbd8313ed055",
            enterDate: BackendDate(seconds: 1, nanoseconds: 1),
            dealAttributes: DealAttributes(
                dealName: "25% Off Specialty Burgers",
                restaurantName: "Buffalo Rose",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                daysActive: [false, true, false, false, false, false, false],
                startDate: BackendDate(seconds: 1, nanoseconds: 1),
                endDate: BackendDate(seconds: 1, nanoseconds: 1),
                recurring: true
            )
        )
        )
        )
    }
}
