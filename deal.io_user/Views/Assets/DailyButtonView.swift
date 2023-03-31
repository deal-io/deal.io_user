//
//  DailyButton.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/3/23.
//

import SwiftUI

struct DailyButton: View {
    @State var fillColor: Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(fillColor)
                .frame(width: 145, height: 45)
            Text("Daily")
                .font(.title)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

