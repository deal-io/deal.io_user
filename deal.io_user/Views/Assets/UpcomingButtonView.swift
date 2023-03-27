//
//  UpcomingButton.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/3/23.
//

import SwiftUI

struct UpcomingButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Deal_ioColor.accent)
                .frame(width: 140, height: 40)
            Text("Upcoming")
                .font(.title)
                .foregroundColor(.white)
        }
    }
}
