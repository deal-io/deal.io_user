//
//  DayView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/7/23.
//

import SwiftUI

struct UpcomingDayHourView: View {
    var dealVM: DealViewModel
    
    var body: some View {
        VStack {
            Text("\(dealVM.nextDayUpcoming) at \(dealVM.hourAtStart)")
                .padding(8)
                .background(Deal_ioColor.upcomingColor)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
    }
}
