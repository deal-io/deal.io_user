//
//  SettingsButton.swift
//  deal.io_user
//
//  Created by Tyler Keller on 6/26/23.
//

import SwiftUI

struct SettingsButton: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel = UserViewModel()
    
    @State private var isShowingSettings = false

    var body: some View {
        VStack {
            Button(action: {
                isShowingSettings = true
            }) {
                Image(systemName: "gearshape.fill")
                    .foregroundColor(Deal_ioColor.symbol(for: userManager.colorScheme))
                    .font(.system(size: 22))
                    .padding(25)
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView(isShowing: $isShowingSettings)
            }
        }
    }
}
