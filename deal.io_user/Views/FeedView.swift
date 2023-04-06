//
//  FavoritesView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 4/5/23.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel: UserViewModel
    let deals: [Deal]
    let upcoming: Bool
    
    var body: some View {
        if self.viewModel.deals.isEmpty {
            VStack {
                ProgressView("Loading deals...")
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    .scaleEffect(2.0)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Deal_ioColor.background)
        } else {
            RefreshableScrollView(refreshing: self.$viewModel.loading) {
                LazyVStack{
                    ForEach(self.deals, id:\.id) { deal in
                        DealView(viewModel: viewModel, deal: deal, upcoming: upcoming)
                    }
                }
            }
        }
    }
}
