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
        Image(systemName: "star.fill")
            .padding(10)
            .background(fillColor)
            .foregroundColor(.white)
            .clipShape(Circle())
    }
}
