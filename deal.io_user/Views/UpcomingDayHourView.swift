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

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingDayHourView(dealVM: DealViewModel(deal: Deal(id: "", restaurantID: "", enterDate: DateVal(_seconds: 1, _nanoseconds: 1), dealAttributes: DealAttributes(daysActive: [false, false, true, false, false, false, false], dealName: "bruh", description: "bruh bruh", startDate: DateVal(_seconds: 1, _nanoseconds: 1), endDate: DateVal(_seconds: 1, _nanoseconds: 1), recurring: true))))
    }
}
