//
//  FromToTimeBubbleView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/27/23.
//

import SwiftUI

struct FromToTimeBubble: View {
    @ObservedObject var viewModel: UserViewModel
    var deal: Deal
    
    var body: some View {
        HStack {
            HStack {
                Text("From: ")
                Text("\(DateUtil().checkMilitaryTime(timeString: deal.dealAttributes.startTime))")
                    .padding(8)
                    .background(Deal_ioColor.fromToBubble(for: UserManager.shared.colorScheme))
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            .padding(.leading, 40)
            Spacer()
            HStack {
                Text("To: ")
                Text("\(DateUtil().checkMilitaryTime(timeString: deal.dealAttributes.endTime))")
                    .padding(8)
                    .background(Deal_ioColor.fromToBubble(for: UserManager.shared.colorScheme))
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            .padding(.trailing, 40)
        }
    }
}


