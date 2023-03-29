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
    
    var todaysDict: Dictionary<Int, String> {
        let dateFormatter = DateFormatter()
        var weekdays = [Int: String]()

        for i in 0...6 {
            dateFormatter.dateFormat = "EEE"
            let date = Calendar.current.date(byAdding: .day, value: i, to: Date())!
            let weekday = dateFormatter.string(from: date)
            weekdays[i] = weekday
        }

        print("GHD: UDB: TD: \(weekdays)")
        return weekdays
    }
    
    func getHourDifference(inputHour: String) -> Double {
        let LOG = "GHD: "
        print("\(LOG)inputHour: \(inputHour)")
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        let currentHour = formatter.string(from: Date())
        print("\(LOG)currentHour: \(currentHour)")
        
        let inputHourDate = formatter.date(from: inputHour)
        let currentHourDate = formatter.date(from: currentHour)
        print("\(LOG)currentHourDate: \(String(describing: currentHourDate))")
        print("\(LOG)inputHourDate: \(String(describing: inputHourDate))")
        
        let calendar = Calendar.current
        let timeDifference = inputHourDate!.timeIntervalSince(currentHourDate!)
        let hourDifference = timeDifference / 3600.0
        print("\(LOG)hourDifference: \(hourDifference)")
        
        return hourDifference
    }
    
    func getFirstActiveWeekday(daysActive: [Bool]) -> String? {
        var index = 0
        
        repeat {
            if daysActive[index] {
                print("GHD: UDB: TD: DA: \(self.todaysDict[index])")
                return self.todaysDict[index]
            }
            index = (index + 1) % 7
        } while true
        
        return nil
    }
    
    func getAllActiveWeekdays(daysActive: [Bool]) -> [String] {
        var weekdays: [String] = []
        
        for index in 0...6 {
            if daysActive[index] {
                weekdays.append(self.todaysDict[index]!)
            }
        }
        
        return weekdays
    }
}
