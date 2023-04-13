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
    static let favorite = "favorite"
    static let unfavorite = "unfavorite"
    static let share = "share"
}

func logDealClickEvent(viewModel: UserViewModel, deal: Deal) -> Void {
    let parameters = [
        "user_id":"\(UserManager.shared.userID)" as NSObject,
        "deal_id": "\(deal.id)" as NSObject,
        "deal_name": "\(deal.dealAttributes.dealName)" as NSObject,
        "restaurant_name": "\(viewModel.nameMap[deal.restaurantID] ?? "nil")" as NSObject,
        "upcoming_or_daily": "\(deal.dealAttributes.daysActive[0] ? "daily" : "upcoming")" as NSObject
    ] as [String : Any]
    Analytics.logEvent(AnalyticsEvents.dealClick, parameters: parameters)
}

func logDealFavorite(viewModel: UserViewModel, deal: Deal) -> Void {
    let parameters = [
        "user_id":"\(UserManager.shared.userID)" as NSObject,
        "deal_id": "\(deal.id)" as NSObject,
        "deal_name": "\(deal.dealAttributes.dealName)" as NSObject,
        "restaurant_name": "\(viewModel.nameMap[deal.restaurantID] ?? "nil")" as NSObject,
        "upcoming_or_daily": "\(deal.dealAttributes.daysActive[0] ? "daily" : "upcoming")" as NSObject
    ] as [String : Any]
    Analytics.logEvent(AnalyticsEvents.favorite, parameters: parameters)
}

func logDealUnfavorite(viewModel: UserViewModel, deal: Deal) -> Void {
    let parameters = [
        "user_id":"\(UserManager.shared.userID)" as NSObject,
        "deal_id": "\(deal.id)" as NSObject,
        "deal_name": "\(deal.dealAttributes.dealName)" as NSObject,
        "restaurant_name": "\(viewModel.nameMap[deal.restaurantID] ?? "nil")" as NSObject,
        "upcoming_or_daily": "\(deal.dealAttributes.daysActive[0] ? "daily" : "upcoming")" as NSObject
    ] as [String : Any]
    Analytics.logEvent(AnalyticsEvents.unfavorite, parameters: parameters)
}

func logMapOpenEvent(viewModel: UserViewModel, deal: Deal) {
    let parameters = [
        "user_id":"\(UserManager.shared.userID)" as NSObject,
        "deal_id": "\(deal.id)" as NSObject,
        "deal_name": "\(deal.dealAttributes.dealName)" as NSObject,
        "restaurant_name": "\(viewModel.nameMap[deal.restaurantID] ?? "nil")" as NSObject
    ] as [String : Any]
    Analytics.logEvent(AnalyticsEvents.mapOpen, parameters: parameters)
}

func logRefreshEvent(viewModel: UserViewModel) {
    let parameters = [
        "user_id":"\(UserManager.shared.userID)" as NSObject,
        "refresh": "\(viewModel.currentFeed)" as NSObject,
    ] as [String : Any]
    Analytics.logEvent(AnalyticsEvents.refresh, parameters: parameters)
}

func logDealShareEvent(viewModel: UserViewModel, deal: Deal) -> Void {
    let parameters = [
        "user_id":"\(UserManager.shared.userID)" as NSObject,
        "deal_id": "\(deal.id)" as NSObject,
        "deal_name": "\(deal.dealAttributes.dealName)" as NSObject,
        "restaurant_name": "\(viewModel.nameMap[deal.restaurantID] ?? "nil")" as NSObject,
        "upcoming_or_daily": "\(deal.dealAttributes.daysActive[0] ? "daily" : "upcoming")" as NSObject
    ] as [String : Any]
    Analytics.logEvent(AnalyticsEvents.share, parameters: parameters)
}

