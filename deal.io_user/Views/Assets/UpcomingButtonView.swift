//
//  UpcomingButton.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/3/23.
//

import SwiftUI

struct UpcomingButton: View {
    @State var fillColor: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(fillColor)
                .frame(width: 145, height: 45)
            Text("Upcoming")
                .font(.title)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}
