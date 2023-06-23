//
//  Deal-ioColor.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

struct Deal_ioColor {
    @ObservedObject var userManager = UserManager.shared
    /*
    static var accent = Color(red: 25/255, green: 25/255, blue: 25/255)
    static var background = Color(red: 30/255, green: 30/255, blue: 30/255)
    static var fromToBubble = Color(red: 35/255, green: 35/255, blue: 35/255)
    static var contractedDeal = Color(red: 40/255, green: 40/255, blue: 40/255)
    static var expandedDeal = Color(red: 45/255, green: 45/255, blue: 45/255)
    static var onBackground = Color(red: 50/255, green: 50/255, blue: 50/255)
    static var star = Color(red:252.0/255.0, green:194.0/255.0, blue:0/255)
    static var selected = Color(red: 85/255, green: 85/255, blue: 85/255)
    // changed below using coolors.co for white text accessibility purposes
    static var oneHourColor = Color(red: 133/255, green: 7/255, blue: 0/255) // Dark red
    static var twoHourColor = Color(red: 77/255, green: 64/255, blue: 0/255) // Dark mustard
    static var fourHourColor = Color(red: 16/255, green: 76/255, blue: 26/255) // Dark green
    static var upcomingColor = Color(red: 6/255, green: 57/255, blue: 152/255) // Dark blue
    static var lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static var darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    
    static var tabColor = Color(red: 30/255, green: 30/255, blue: 30/255)
     */
    
    static func accent(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 230/255, green: 230/255, blue: 230/255)
        case .dark:
            return Color(red: 25/255, green: 25/255, blue: 25/255)
        }
    }
    static func background(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 225/255, green: 225/255, blue: 225/255)
        case .dark:
            return Color(red: 30/255, green: 30/255, blue: 30/255)
        }
    }
    static func fromToBubble(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 220/255, green: 220/255, blue: 220/255)
        case .dark:
            return Color(red: 35/255, green: 35/255, blue: 35/255)
        }
    }
    static func contractedDeal(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 215/255, green: 215/255, blue: 215/255)
        case .dark:
            return Color(red: 40/255, green: 40/255, blue: 40/255)
        }
    }
    static func expandedDeal(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 210/255, green: 210/255, blue: 210/255)
        case .dark:
            return Color(red: 45/255, green: 45/255, blue: 45/255)
        }
    }
    static func onBackground(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 205/255, green: 205/255, blue: 205/255)
        case .dark:
            return Color(red: 50/255, green: 50/255, blue: 50/255)
        }
    }
    static func star(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red:252/255, green:194/255, blue:0/255)
        case .dark:
            return Color(red:252/255, green:194/255, blue:0/255)
        }
    }
    static func selected(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 170/255, green: 170/255, blue: 170/255)
        case .dark:
            return Color(red: 85/255, green: 85/255, blue: 85/255)
        }
    }
    static func oneHourColor(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 133/255, green: 7/255, blue: 0/255)
        case .dark:
            return Color(red: 133/255, green: 7/255, blue: 0/255)
        }
    }
    static func twoHourColor(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 77/255, green: 64/255, blue: 0/255)
        case .dark:
            return Color(red: 77/255, green: 64/255, blue: 0/255)
        }
    }
    static func fourHourColor(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 16/255, green: 76/255, blue: 26/255)
        case .dark:
            return Color(red: 16/255, green: 76/255, blue: 26/255)
        }
    }
    static func upcomingColor(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 6/255, green: 57/255, blue: 152/255)
        case .dark:
            return Color(red: 6/255, green: 57/255, blue: 152/255)
        }
    }
    static func lightShadow(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 255/255, green: 255/255, blue: 255/255)
        case .dark:
            return Color(red: 255/255, green: 255/255, blue: 255/255)
        }
    }
    static func darkShadow(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 163/255, green: 177/255, blue: 198/255)
        case .dark:
            return Color(red: 163/255, green: 177/255, blue: 198/255)
        }
    }
    static func tabColor(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 225/255, green: 225/255, blue: 225/255)
        case .dark:
            return Color(red: 30/255, green: 30/255, blue: 30/255)
        }
    }
    static func text(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 0/255, green: 0/255, blue: 0/255)
        case .dark:
            return Color(red: 255/255, green: 255/255, blue: 255/255)
        }
    }
    static func restaurantText(for colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return Color(red: 25/255, green: 25/255, blue: 25/255)
        case .dark:
            return Color(red: 230/255, green: 230/255, blue: 230/255)
        }
    }
    static func dealio_logo(for colorScheme: ColorScheme) -> String {
        switch colorScheme {
        case .light:
            return "dealio_light"
        case .dark:
            return "dealio_dark"
        }
    }
}

enum ColorScheme: String {
    case light
    case dark
}
