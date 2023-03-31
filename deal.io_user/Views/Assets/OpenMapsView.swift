//
//  OpenMapsView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/27/23.
//

import SwiftUI
import FirebaseAnalytics

struct OpenMapsView: View {
    @ObservedObject var viewModel: UserViewModel
    var deal: Deal
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: {
            action()
            logMapOpenEvent(viewModel: viewModel, deal: deal)
            let address = viewModel.locationMap[deal.restaurantID] ?? ""
            let encodedAddress = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            let url = URL(string: "maps://?q=\(encodedAddress)")!
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }) {
            Text("\(viewModel.locationMap[deal.restaurantID] ?? "Unwrapped Nil Restaurant")")
                .foregroundColor(.white)
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Deal_ioColor.selected)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                )
        }
    }
}
