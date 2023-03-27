//
//  RefreshButton.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/27/23.
//

import SwiftUI

struct RefreshButton: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Deal_ioColor.accent)
                .frame(width: 53, height: 43)
            Image(systemName: "arrow.clockwise.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 50, height: 40)
        }
    }
}
