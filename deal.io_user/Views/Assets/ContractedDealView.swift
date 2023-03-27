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
    
    init(viewModel: UserViewModel, deal: Deal) {
        self.viewModel = viewModel
        self.deal = deal
        print("Name Map: \(viewModel.nameMap)")
        print("ID: \(deal.restaurantID)")
    }

    var body: some View {
        VStack{
            Spacer()
            Text(deal.dealAttributes.dealName)
                .font(.title)
                .foregroundColor(.white)
                .padding(.horizontal, 4.5)
                .multilineTextAlignment(.center)
            
            HStack {
                Text(viewModel.nameMap[deal.restaurantID] ?? "Returned nil")
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

