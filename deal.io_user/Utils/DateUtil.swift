//
//  DateUtil.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/8/23.
//

import Foundation
import Firebase

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

        return weekdays
    }
    
    func checkMilitaryTime(timeString: String) -> String {
        let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "h:mm a"
        
        var date = dateFormatter.date(from: timeString)
        
        if (date == nil){
            let military = convertToMilitaryTime(timeString: timeString)
            dateFormatter.dateFormat = "HH:mm"
            date = dateFormatter.date(from: convertToMilitaryTime(timeString: timeString))
            if (date == nil){
                return ""
            }
            return military
        }
      
        return timeString
    }
    
    func convertToMilitaryTime(timeString: String) -> String {
        var components = timeString.components(separatedBy: " ")
           var timeComponents = components[0].components(separatedBy: ":")
           var hour = Int(timeComponents[0]) ?? 0
           let minute = timeComponents[1]
           let amPM = components[1]
           
           if amPM == "PM" && hour < 12 {
               hour += 12
           } else if amPM == "AM" && hour == 12 {
               hour = 0
           }
           
           let militaryTime = String(format: "%02d:%@", hour, minute)
           return militaryTime
    }

    
    func getHourDifference(inputHour: String) -> Double {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "hh:mm a"
        
        let currentHour = formatter.string(from: Date())
        
        let inputHourDate = formatter.date(from: inputHour)
        let currentHourDate = formatter.date(from: currentHour)
        
        let timeDifference = inputHourDate!.timeIntervalSince(currentHourDate!)
        let hourDifference = timeDifference / 3600.0
        
        return hourDifference
    }
    
    func getFirstActiveWeekday(daysActive: [Bool]) -> String? {
        var index = 0
        
        repeat {
            if daysActive[index] {
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
