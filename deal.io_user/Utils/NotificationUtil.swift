//
//  NotificationUtil.swift
//  deal.io_user
//
//  Created by Tyler Keller on 5/28/23.
//

import Foundation
import UserNotifications

/*
 when a user favorites a deal, notifications are scheduled for the morning the deal becomes active and an hour before the deal becomes active
 */
func scheduleNotification(for deal: Deal) {
    let center = UNUserNotificationCenter.current()
    
    let morningIdentifier = "\(deal.id)_morning"
    let hourBeforeIdentifier = "\(deal.id)_hourBefore"
    
    let morningContent = UNMutableNotificationContent()
    morningContent.title = "Deal Reminder"
    morningContent.body = "\(deal.dealAttributes.dealName) is today!"
    morningContent.sound = UNNotificationSound.default
    
    let hourBeforeContent = UNMutableNotificationContent()
    hourBeforeContent.title = "1 Hour!"
    hourBeforeContent.body = "\(deal.dealAttributes.dealName) starts in one hour."
    hourBeforeContent.sound = UNNotificationSound.default

    // Set the trigger for the morning of the deal
    var startDate = DateUtil().secondsToDate(seconds: deal.dealAttributes.startDate._seconds, nanoseconds: deal.dealAttributes.startDate._nanoseconds)
    var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: startDate)
    dateComponents.hour = 8 // 8AM in the morning
    dateComponents.minute = 0
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

    // Set the trigger for an hour before the deal
    let hourBeforeDeal = Calendar.current.date(byAdding: .hour, value: -1, to: startDate)!
    dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: hourBeforeDeal)
    let triggerHourBefore = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
    
    let request = UNNotificationRequest(identifier: morningIdentifier, content: morningContent, trigger: trigger)
    center.add(request)

    let requestHourBefore = UNNotificationRequest(identifier: hourBeforeIdentifier, content: hourBeforeContent, trigger: triggerHourBefore)
    center.add(requestHourBefore)
}

func removeScheduledNotification(for deal: Deal) {
    let center = UNUserNotificationCenter.current()
    
    // Again, use deal's ID to reproduce the identifiers
    let morningIdentifier = "\(deal.id)_morning"
    let hourBeforeIdentifier = "\(deal.id)_hourBefore"
    
    center.removePendingNotificationRequests(withIdentifiers: [morningIdentifier, hourBeforeIdentifier])
}
