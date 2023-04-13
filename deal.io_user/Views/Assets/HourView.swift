//
//  DayView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/7/23.
//

import SwiftUI

struct HourView: View {
    let LOG_TAG = "HOUR_VIEW: "
    
    @ObservedObject var viewModel: UserViewModel
    var deal: Deal
    var upcoming: Bool
    var startTime: String
    var endTime: String
    var startHourDifference: Double
    var endHourDifference: Double
    var upcomingDay: String
    var active: Bool

    
    init(viewModel: UserViewModel, deal: Deal, upcoming: Bool) {
        self.viewModel = viewModel
        self.deal = deal
        self.upcoming = upcoming
        self.startTime = deal.dealAttributes.startTime
        self.endTime = deal.dealAttributes.endTime
        print("GHD: UDB: \(deal.dealAttributes.dealName)")
        self.startHourDifference = DateUtil().getHourDifferenceBetweenNow(inputHour: startTime)
        self.endHourDifference = DateUtil().getHourDifferenceBetweenNow(inputHour: endTime)
        // if deal.dealAttributes.daysActive[0] is true, this means the deal is active, if its also upcoming, we want to only get the next available day
        self.upcomingDay = (viewModel.upcomingSortType == UpcomingSortType.DAY_ASC ? DateUtil().getFirstActiveWeekday(daysActive: deal.dealAttributes.daysActive, skipFirst: deal.dealAttributes.daysActive[0])! : DateUtil().getLastActiveWeekday(daysActive: deal.dealAttributes.daysActive)!)
        print("GHD: UDB: \(deal.dealAttributes.daysActive)")
        print("GHD: UDB: \(upcomingDay)")
        self.active = deal.dealAttributes.daysActive[0]
       
    }
    
    var body: some View {
        VStack {
            if (active && upcoming == false) {
                if startHourDifference > 0 {
                    Text("@\(DateUtil().checkMilitaryTime(timeString: startTime))")
                        .font(.title2)
                        .padding(8)
                        .background(Deal_ioColor.upcomingColor)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                } else {
                    if endHourDifference < 0 {
                        Text("Ended")
                            .font(.title2)
                            .padding(8)
                            .background(Deal_ioColor.oneHourColor)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    } else if endHourDifference <= 1 {
                        Text("< 1 hr left")
                            .font(.title2)
                            .padding(8)
                            .background(Deal_ioColor.oneHourColor)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    } else if endHourDifference <= 2 {
                        Text("\(Int(ceil(endHourDifference))) hrs left")
                            .font(.title2)
                            .padding(8)
                            .background(Deal_ioColor.twoHourColor)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    } else if endHourDifference > 2 {
                        Text("\(Int(ceil(endHourDifference))) hrs left")
                            .font(.title2)
                            .padding(8)
                            .background(Deal_ioColor.fourHourColor)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                }
            } else {
                    VStack(alignment: .trailing, spacing: 5){
                        Text("\(upcomingDay)")
                            .font(.title2)
                            .padding(8)
                            .background(Deal_ioColor.upcomingColor)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                        
                        Text("\(DateUtil().checkMilitaryTime(timeString: startTime))")
                            .font(.title2)
                            .padding(8)
                            .background(Deal_ioColor.upcomingColor)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }.padding(8)
                
            }

        }
    }
}
