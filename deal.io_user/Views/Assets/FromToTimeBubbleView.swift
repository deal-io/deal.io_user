//
//  FromToTimeBubbleView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/27/23.
//

import SwiftUI

struct FromToTimeBubbleView: View {
    @ObservedObject var viewModel: UserViewModel
    var deal: Deal
    
    var body: some View {
        HStack {
            HStack {
                Text("From: ")
                Text("\(deal.dealAttributes.startTime)")
                    .padding(8)
                    .background(Deal_ioColor.fromToBubble)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            .padding(.leading, 40)
            Spacer()
            HStack {
                Text("To: ")
                Text("\(deal.dealAttributes.endTime)")
                    .padding(8)
                    .background(Deal_ioColor.fromToBubble)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            .padding(.trailing, 40)
        }
    }
}

