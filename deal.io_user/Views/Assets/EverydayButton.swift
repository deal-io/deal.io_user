//
//  EverydayButton.swift
//  deal.io_user
//
//  Created by Tyler Keller on 5/28/23.
//

import SwiftUI

struct EverydayButton: View {
    @ObservedObject var userManager = UserManager.shared

    var body: some View {
        Image(systemName: "questionmark.circle").foregroundColor(.white).font(.system(size: 22)).padding(15)
    }
}

