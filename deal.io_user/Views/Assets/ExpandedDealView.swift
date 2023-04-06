//
//  ExpandedDealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

struct ExpandedDealView: View {
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
            FromToTimeBubbleView(viewModel: viewModel, deal: deal)
                .padding(.bottom, 10)
            ActiveDaysBubbleView(viewModel: viewModel, deal: deal)
            Text(deal.dealAttributes.description)
                .padding(10)
                .multilineTextAlignment(.center)
            OpenMapsView(viewModel: viewModel, deal: deal)
            
            Text(viewModel.nameMap[deal.restaurantID] ?? "Nil name")
                .font(.title2)
               
            Spacer()
        }
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Deal_ioColor.expandedDeal)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .padding(.horizontal, 2)
                .padding(.vertical, 2)
        )
        .foregroundColor(.white)
    }
}


