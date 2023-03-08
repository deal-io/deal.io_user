//
//  DealViewModel.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/7/23.
//

import Foundation

class DealViewModel: ObservableObject{
    
    var deal: Deal
    
    init(deal: Deal) {
        self.deal = deal
    }
    
    var id = UUID()
    
    var dealName: String {
        return self.deal.dealAttributes.dealName
    }
   
    // TODO: figure out this shit
//    var restaurantName: String {
//        return self.deal.dealAttributes.restaurantName
//    }
    
    var restaurantName: String {
        return "Buffalo Rose"
    }
    
    var description: String {
        return self.deal.dealAttributes.description
    }
    
    var daysActive: [Bool] {
        return self.deal.dealAttributes.daysActive
    }
    
    var startDate: Date {
        return DateUtil().secondsToDate(seconds: self.deal.dealAttributes.startDate.seconds, nanoseconds: self.deal.dealAttributes.startDate.nanoseconds)
    }
    
    var endDate: Date {
        return DateUtil().secondsToDate(seconds: self.deal.dealAttributes.endDate.seconds, nanoseconds: self.deal.dealAttributes.endDate.nanoseconds)
    }
    
    var startCalendarDateComponents: DateComponents {
        return DateUtil().dateToCalendarComponents(date: self.startDate)
    }
    var endCalendarDateComponents: DateComponents {
        return DateUtil().dateToCalendarComponents(date: self.endDate)
    }
    
    var recurring: Bool {
        return self.deal.dealAttributes.recurring
    }
    
    var hoursToStart: Int {
        return DateUtil().diffCurrentDateToInputDate(date: startDate)
    }
    
    var hoursToEnd: Int {
        return DateUtil().diffCurrentDateToInputDate(date: endDate)
    }
    
    var hourAtStart: String {
        return DateUtil().formattedHourComponentFromDate(date: startDate)
    }
    
    var active: Bool {
        if (self.hoursToStart <= 0 && self.hoursToEnd > 0) {
            return true
        } else {
            return false
        }
    }
    
}
