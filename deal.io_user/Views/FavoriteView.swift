//
//  FavoriteView.swift
//  deal.io_user
//
//  Created by Levi Ortega on 4/5/23.
//

import Foundation
import SwiftUI
import NotificationCenter

struct FavoriteView: View {
    
    @ObservedObject var viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        //print("LOG Fav View")
    }
    
    var body: some View {
        VStack {
            Image("dealio_white_on_bg")
                .resizable()
                .frame(width: 200, height: 80)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Deal_ioColor.onBackground)
                    .frame(width: 145, height: 45)
                Text("Favorites")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            FeedView(viewModel: viewModel, deals: viewModel.getFavoriteDeals(), upcoming: false)
        }
        .onAppear {
            requestNotificationPermission()
        }
    }
}

func requestNotificationPermission() {
    UNUserNotificationCenter.current().getNotificationSettings { settings in
        if settings.authorizationStatus == .notDetermined {
            DispatchQueue.main.async {
                let alertController = UIAlertController(title: "Allow Notifications?", message: "We'll use notifications to inform you about your favorite deals.", preferredStyle: .alert)

                let okayAction = UIAlertAction(title: "Okay", style: .default) { _ in
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                        if let error = error {
                            print("Error requesting authorization for notifications: \(error.localizedDescription)")
                        }
                    }
                }


                alertController.addAction(okayAction)

                if let viewController = UIApplication.shared.windows.first?.rootViewController {
                    viewController.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
