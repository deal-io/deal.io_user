//
//  FavoriteView.swift
//  deal.io_user
//
//  Created by Levi Ortega on 4/5/23.
//

import Foundation
import SwiftUI
import NotificationCenter
import FirebaseMessaging

struct Favorites: View {
    
    @ObservedObject var viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Image("dealio_white_on_bg")
                .resizable()
                .frame(width: 200, height: 80)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Deal_ioColor.onBackground(for: UserManager.shared.colorScheme))
                    .frame(width: 145, height: 45)
                Text("Favorites")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            FeedView(viewModel: viewModel, deals: viewModel.getFavoriteDeals(), upcoming: false)
        }
        .onAppear {
            viewModel.requestNotificationPermission()
        }
    }
}
