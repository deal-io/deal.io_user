//
//  StarButtonView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 4/5/23.
//

import SwiftUI

struct StarButton: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel: UserViewModel
    @State var favorited: Bool
    var deal: Deal
    
    init(viewModel: UserViewModel, deal: Deal) {
        self.viewModel = viewModel
        self.deal = deal
        self.favorited = viewModel.checkDealFavorite(deal: deal)
    }
    
    var body: some View {
        Button(action: {
            if favorited {
                favorited = false
                UserManager.shared.removeFavorite(dealID: deal.id)
                logDealUnfavorite(viewModel: viewModel, deal: deal)
            } else {
                favorited = true
                UserManager.shared.addFavorite(dealID: deal.id)
                logDealFavorite(viewModel: viewModel, deal: deal)
            }
        }) {
            if favorited {
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(Deal_ioColor.star(for: UserManager.shared.colorScheme))
                    .frame(width: 30, height: 30)
            } else {
                Image(systemName: "star")
                    .resizable()
                    .foregroundColor(Deal_ioColor.star(for: UserManager.shared.colorScheme))
                .frame(width: 30, height: 30)
            }
        }
    }
}
