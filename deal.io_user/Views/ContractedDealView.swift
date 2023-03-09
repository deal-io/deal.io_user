//
//  ContractedDealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/28/23.
//

import SwiftUI

struct ContractedDealView: View {
    @ObservedObject var dealVM: DealViewModel

    var body: some View {
        VStack{
                Spacer()
            Text(dealVM.dealName)
                .font(.title)
                .foregroundColor(.white)
                .padding(.horizontal, 4.5)
                .multilineTextAlignment(.center)
            
            HStack {
                Text(dealVM.restaurantName)
                    .font(.title3)
                    .padding(.leading, 35)
                Spacer()
                if (dealVM.daily == false) {
                    UpcomingDayHourView(dealVM: dealVM)
                        .padding(.trailing, 35)
                } else {
                    DailyHourView(dealVM: dealVM)
                        .padding(.trailing, 35)
                }
            }
                Spacer()
        }
        .background(Deal_ioColor.background)
        .foregroundColor(.white)
    }
}

