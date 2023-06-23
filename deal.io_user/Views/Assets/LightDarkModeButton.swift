//
//  LightDarkModeButton.swift
//  deal.io_user
//
//  Created by Tyler Keller on 6/23/23.
//

import Foundation
import SwiftUI

struct LightDarkModeButton: View {
    var body: some View {
        VStack {
            Button(action: {
                switch UserManager.shared.colorScheme {
                case .light:
                    UserManager.shared.setColorScheme(.dark)
                case .dark:
                    UserManager.shared.setColorScheme(.light)
                }
            }) {
                switch UserManager.shared.colorScheme {
                case .light:
                    Image(systemName: "circle.lefthalf.filled")
                case .dark:
                    Image(systemName: "circle.righthalf.filled")
                }
            }
        }
    }
}
