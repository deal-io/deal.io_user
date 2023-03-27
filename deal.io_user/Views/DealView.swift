//
//  DealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

struct DealView: View {
    @ObservedObject var viewModel: UserViewModel
    @State private var expanded = false
    var deal: Deal

    
    var body: some View {
        VStack {
            if expanded {
                ExpandedDealView(viewModel: viewModel, deal: deal)
            } else {
                ContractedDealView(viewModel: viewModel, deal: deal)
            }
        }
        .onTapGesture {
            withAnimation {
                expanded.toggle()
            }
        }
    }
}

