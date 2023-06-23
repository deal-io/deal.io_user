//
//  ExpandedDealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

struct ExpandedDeal: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel: UserViewModel
    var deal: Deal
    
    var body: some View {
        VStack{
            Spacer()
            
            Text(deal.dealAttributes.dealName)
                .font(.title)
                .foregroundColor(Deal_ioColor.text(for: userManager.colorScheme))
                .padding(.horizontal, 4.5)
                .multilineTextAlignment(.center)
            
            FromToTimeBubble(viewModel: viewModel, deal: deal)
                .padding(.bottom, 10)
            
            ActiveDaysBubble(viewModel: viewModel, deal: deal)
            
            Text(deal.dealAttributes.description)
                .padding(10)
                .multilineTextAlignment(.center)
            
            OpenMaps(viewModel: viewModel, deal: deal)
            
            Text(viewModel.nameMap[deal.restaurantID] ?? "Nil name")
                .font(.title2)
                
            Spacer()
        }
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Deal_ioColor.expandedDeal(for: UserManager.shared.colorScheme))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .padding(.horizontal, 2)
                .padding(.vertical, 2)
        )
        .foregroundColor(Deal_ioColor.symbol(for: userManager.colorScheme))
        .overlay(
            HStack{
                StarButton(viewModel: viewModel, deal: deal)
                    .padding(.leading, 15)
                    .padding(.top, 20)
                Spacer()
                Button(action: {
                    let appURL = "https://apps.apple.com/app/id6446871125"
                    let shareText = "\(appURL)\nCheck out this deal at \(String(describing: viewModel.nameMap[deal.restaurantID]!)): \(deal.dealAttributes.dealName)"
                    let activityController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
                    UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)
                    logDealShareEvent(viewModel: viewModel, deal: deal)
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(Deal_ioColor.symbol(for: userManager.colorScheme))
                        .padding(.trailing, 25)
                        .padding(.top, 20)
                }
            },
            alignment: .topLeading
        )
    }
}



