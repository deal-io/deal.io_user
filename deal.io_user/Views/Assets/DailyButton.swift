//
//  DailyButton.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/3/23.
//

import SwiftUI

struct DailyButton: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel: UserViewModel
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack{
            if viewModel.currentFeed == .DAILY {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Deal_ioColor.selected(for: userManager.colorScheme))
                    .frame(width: 145, height: 45)
                    .shadow(radius: 5)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Deal_ioColor.onBackground(for: userManager.colorScheme))
                    .frame(width: 145, height: 45)
            }
            Text("Daily")
                .font(.title)
                .foregroundColor(Deal_ioColor.text(for: userManager.colorScheme))
                .fontWeight(.bold)
        }
    }
}

