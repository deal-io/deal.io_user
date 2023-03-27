//
//  DealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

struct DealView: View {
    @ObservedObject var dealVM: DealViewModel
    @State private var expanded = false

    
    var body: some View {
        VStack {
            if expanded {
                ExpandedDealView(dealVM: dealVM)
            } else {
                ContractedDealView(dealVM: dealVM)
            }
        }
        .onTapGesture {
            withAnimation {
                expanded.toggle()
            }
        }
    }
}

