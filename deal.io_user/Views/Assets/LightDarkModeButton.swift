//
//  LightDarkModeButton.swift
//  deal.io_user
//
//  Created by Tyler Keller on 6/23/23.
//

import Foundation
import SwiftUI

struct LightDarkModeButton: View {
    @ObservedObject var userManager = UserManager.shared
    let logtag = "LIGHTDARK: "
    var body: some View {
        VStack {
            Button(action: {
                switch UserManager.shared.colorScheme {
                case .light:
                    UserManager.shared.setColorScheme(.dark)
                    print("\(logtag)\(UserManager.shared.colorScheme)")
                case .dark:
                    UserManager.shared.setColorScheme(.light)
                    print("\(logtag)\(UserManager.shared.colorScheme)")
                }
            }) {
                switch UserManager.shared.colorScheme {
                case .light:
                    Image(systemName: "circle.lefthalf.filled").foregroundColor(.white).font(.system(size: 22)).padding(15)
                case .dark:
                    Image(systemName: "circle.righthalf.filled").foregroundColor(.white).font(.system(size: 22)).padding(15)
                }
            }.padding(15)
        }
    }
}
