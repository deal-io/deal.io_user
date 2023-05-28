//
//  ActiveDaysBubbleView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/27/23.
//

import SwiftUI

struct ActiveDaysBubble: View {
    @ObservedObject var viewModel: UserViewModel
    var deal: Deal
    
    var body: some View {
        HStack {
            if !deal.dealAttributes.daysActive.contains(false) {
                    Text("Everyday")
                        .padding(8)
                        .background(Deal_ioColor.upcomingColor)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
            } else {
                ForEach(DateUtil().getAllActiveWeekdays(daysActive: self.deal.dealAttributes.daysActive), id:\.self) { weekday in
                    Text("\(weekday)")
                        .padding(8)
                        .background(Deal_ioColor.upcomingColor)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
