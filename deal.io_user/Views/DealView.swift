//
//  DealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI
import FirebaseAnalytics

struct DealView: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel: UserViewModel
    @State private var expanded = false
    @State private var isPickerTapped = false
    var deal: Deal
    var upcoming: Bool

    var body: some View {
        VStack {
            if expanded {
                ExpandedDeal(viewModel: viewModel, deal: deal, isPickerTapped: $isPickerTapped)
                    .onAppear {
                        logDealClickEvent(viewModel: viewModel, deal: deal)
                    }
            } else {
                ContractedDeal(viewModel: viewModel, deal: deal, upcoming: upcoming)
            }
        }
        .contentShape(Rectangle()) // Important to ensure onTapGesture covers the whole area
        .onTapGesture {
            if !isPickerTapped {
                generateHapticFeedback()
                withAnimation {
                    expanded.toggle()
                }
            } else {
                isPickerTapped = false
            }
        }
    }
}


