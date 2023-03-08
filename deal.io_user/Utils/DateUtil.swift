//
//  DateUtil.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/8/23.
//

import Foundation

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

class DateUtil {
    
    func secondsToDate(seconds: Int64, nanoseconds: Int64) -> Date {
        let timeInterval = TimeInterval(seconds + (nanoseconds / 1_000_000_000))
        return Date(timeIntervalSinceReferenceDate: timeInterval)
    }
    
    func dateToCalendarComponents(date: Date) -> DateComponents {
        return Calendar.current.dateComponents([.day, .year, .month], from: date)
    }
    
    func diffCurrentDateToInputDate(date: Date) -> Int {
        let diffComponents = Calendar.current.dateComponents([.hour], from: Date(), to: date)
        let hours = diffComponents.hour
        return hours!
    }
    
    func formattedHourComponentFromDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: date)
    }
    
}
