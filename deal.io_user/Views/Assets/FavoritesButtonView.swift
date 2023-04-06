//
//  FavoritesButtonView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 4/5/23.
//

import SwiftUI

struct FavoritesButton: View {
    @State var fillColor: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(fillColor)
                .frame(width: 120, height: 40)
            Text("Favorites")
                .font(.title2)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}
