//
//  AnalyticsEvents.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/31/23.
//
import Firebase
import FirebaseAnalytics

struct AnalyticsEvents {
    static let dealClick = "deal_click"
    static let mapOpen = "map_open"
    static let refresh = "refresh"
}

func logDealClickEvent(viewModel: UserViewModel, deal: Deal) -> Void {
    let parameters = [
        "deal_id": "\(deal.id ?? "nil")" as NSObject,
        "deal_name": "\(deal.dealAttributes.dealName)" as NSObject,
        "restaurant_name": "\(viewModel.nameMap[deal.restaurantID] ?? "nil")" as NSObject,
        "upcoming_or_daily": "\(deal.dealAttributes.daysActive[0] ? "daily" : "upcoming")" as NSObject
    ] as [String : Any]
    print("LOG: \(AnalyticsEvents.dealClick): \(parameters)")
    Analytics.logEvent(AnalyticsEvents.dealClick, parameters: parameters)
}

func logMapOpenEvent(viewModel: UserViewModel, deal: Deal) {
    let parameters = [
        "deal_id": "\(deal.id ?? "nil")" as NSObject,
        "deal_name": "\(deal.dealAttributes.dealName)" as NSObject,
        "restaurant_name": "\(viewModel.nameMap[deal.restaurantID] ?? "nil")" as NSObject
    ] as [String : Any]
    print("LOG: \(AnalyticsEvents.mapOpen): \(parameters)")
    Analytics.logEvent(AnalyticsEvents.mapOpen, parameters: parameters)
}

func logRefreshEvent(viewModel: UserViewModel) {
    let parameters = [
        "user_email": "\(UserManager.shared.userDefaults.string(forKey: "userEmail") ?? "nil")" as NSObject,
    ] as [String : Any]
    print("LOG: \(AnalyticsEvents.refresh): \(parameters)")
    Analytics.logEvent(AnalyticsEvents.refresh, parameters: parameters)
}
