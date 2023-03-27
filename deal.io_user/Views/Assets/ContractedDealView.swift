//
//  ContractedDealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/28/23.
//

import SwiftUI

struct ContractedDealView: View {
    @ObservedObject var viewModel: UserViewModel
    var deal: Deal

    var body: some View {
        VStack{
            Spacer()
            Text(deal.dealAttributes.dealName)
                .font(.title)
                .foregroundColor(.white)
                .padding(.horizontal, 4.5)
                .multilineTextAlignment(.center)
            
            HStack {
                Text(viewModel.nameMap[deal.restaurantID]!)
                    .font(.title3)
                    .padding(.leading, 35)
                Spacer()
                HourView(viewModel: viewModel, deal: deal)
                    .padding(.trailing, 35)
            }
                Spacer()
        }
        .background(Deal_ioColor.background)
        .foregroundColor(.white)
    }
}

