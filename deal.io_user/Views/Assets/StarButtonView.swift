//
//  StarButtonView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 4/5/23.
//

import SwiftUI

struct StarButtonView: View {
    @ObservedObject var viewModel: UserViewModel
    @State var favorited: Bool
    var deal: Deal
    
    init(viewModel: UserViewModel, deal: Deal) {
        self.viewModel = viewModel
        self.deal = deal
        self.favorited = viewModel.checkDealFavorite(deal: deal)
        print("F: init favorited: \(self.favorited)")
    }
    
    var body: some View {
        Button(action: {
            if favorited {
                favorited = false
                UserManager.shared.removeFavorite(dealID: deal.id)
                print("F: init favorited: \(self.favorited)")
            } else {
                favorited = true
                UserManager.shared.addFavorite(dealID: deal.id)
                print("F: init favorited: \(self.favorited)")
            }
        }) {
            if favorited {
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(Deal_ioColor.star)
                    .frame(width: 30, height: 30)
            } else {
                Image(systemName: "star")
                    .resizable()
                    .foregroundColor(Deal_ioColor.star)
                .frame(width: 30, height: 30)
            }
        }
    }
}
