//
//  ExpandedDealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

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
            Text(deal.dealAttributes.description)
                .padding(10)
                .multilineTextAlignment(.center)
            Text(viewModel.locationMap[deal.restaurantID] ?? "Location returned nil")
                .padding(10)
                .multilineTextAlignment(.center)
                HStack {
                    Text(viewModel.nameMap[deal.restaurantID] ?? "Name returned nil")
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


