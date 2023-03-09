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



