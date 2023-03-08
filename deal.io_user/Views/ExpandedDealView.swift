//
//  ExpandedDealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

import SwiftUI

struct ExpandedDealView: View {
    @ObservedObject var dealVM: DealViewModel

    var body: some View {
        VStack{
            Spacer()
            Text(dealVM.dealName)
                .font(.title)
                .foregroundColor(.white)
                .padding(.horizontal, 4.5)
                .multilineTextAlignment(.center)
            Text(dealVM.description)
                .padding(10)
                .multilineTextAlignment(.center)
                HStack {
                    Text(dealVM.restaurantName)
                        .font(.title3)
                        .padding(.leading, 35)
                    Spacer()
                    HourView(dealVM: dealVM)
                        .padding(.trailing, 35)
                }
                Spacer()
            }
            .background(Deal_ioColor.background)
            .foregroundColor(.white)
    }
}

struct ExpandedDealView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedDealView(dealVM: DealViewModel(deal: Deal(
            id: "912ec803b2ce49e4a541068d495ab570",
            restaurantID: "81dc9bdb52d04dc20036dbd8313ed055",
            enterDate: DateVal(seconds: 1, nanoseconds: 1),
            dealAttributes: DealAttributes(
                daysActive: [false, true, false, false, false, false, false],
                dealName: "25% Off Specialty Burgers",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                startDate: DateVal(seconds: 1, nanoseconds: 1),
                endDate: DateVal(seconds: 1, nanoseconds: 1),
                recurring: true
            )
        )
        ))
    }
}

