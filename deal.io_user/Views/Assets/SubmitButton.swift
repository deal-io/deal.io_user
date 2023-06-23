//
//  SubmitButtonView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/26/23.
//

import Foundation
import SwiftUI

struct SubmitButton: View {
    @ObservedObject var userManager = UserManager.shared

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
                .frame(width: 160, height: 80)
            Text("Submit")
                .font(.title)
                .foregroundColor(Deal_ioColor.text(for: userManager.colorScheme))
        }
    }
}
