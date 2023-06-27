//
//  DealInfo.swift
//  deal.io_user
//
//  Created by Tyler Keller on 6/26/23.
//

import SwiftUI

struct DealInfo: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel: UserViewModel
    var deal: Deal
        
    var body: some View {
        VStack {
            
            FromToTimeBubble(viewModel: viewModel, deal: deal)
                .padding(.bottom, 10)
            
            ActiveDaysBubble(viewModel: viewModel, deal: deal)
            
            Text(deal.dealAttributes.description)
                .padding(10)
                .multilineTextAlignment(.center)
        }
    }
}

