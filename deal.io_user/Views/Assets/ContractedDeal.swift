//
//  ContractedDealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/28/23.
//

import SwiftUI

struct ContractedDeal: View {
    @ObservedObject var viewModel: UserViewModel
    var deal: Deal
    var upcoming: Bool
    
    init(viewModel: UserViewModel, deal: Deal, upcoming: Bool) {
        self.viewModel = viewModel
        self.deal = deal
        self.upcoming = upcoming
        print("Name Map: \(viewModel.nameMap)")
        print("ID: \(deal.restaurantID)")
    }

    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading) {
                    Text(deal.dealAttributes.dealName)
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    
                    Text(viewModel.nameMap[deal.restaurantID] ?? "Returned nil")
                        .font(.title2)
                        .foregroundColor(Color.gray)
                        
                }
                Spacer()
                HourBubble(viewModel: viewModel, deal: deal, upcoming: upcoming)
                    .padding(.trailing, 5)
            }.padding(.horizontal, 20).padding(.vertical, 30)
                
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Deal_ioColor.contractedDeal)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .padding(.horizontal, 5)
                .padding(.vertical, 2)
        )
        .foregroundColor(.white)
    }
}
