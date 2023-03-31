//
//  DailyView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/28/23.
//

import SwiftUI

struct DailyView: View {
    @ObservedObject var viewModel: UserViewModel
    let deals: [Deal]
    
    var body: some View {
        RefreshableScrollView(refreshing: self.$viewModel.loading) {
            LazyVStack{
                ForEach(self.deals, id:\.id) { deal in
                    DealView(viewModel: viewModel, deal: deal)
                }
            }
        }
    }
}

