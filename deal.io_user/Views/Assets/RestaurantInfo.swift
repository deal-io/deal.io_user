//
//  RestaurantInfo.swift
//  deal.io_user
//
//  Created by Tyler Keller on 6/26/23.
//

import SwiftUI

struct RestaurantInfo: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel: UserViewModel
    var deal: Deal
    var yelpBusiness: Business?
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(viewModel.nameMap[deal.restaurantID] ?? "Nil name")
                    .font(.title2)
                
                if let yelpBusiness = yelpBusiness {
                    AsyncImage(url: URL(string: yelpBusiness.imageUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 300, height: 200)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text("Rating: \(String(format: "%.1f", yelpBusiness.rating)) | \(yelpBusiness.reviewCount) reviews" + (yelpBusiness.price != nil ? " | Price range: \(yelpBusiness.price!)" : ""))
                }
                
                OpenMaps(viewModel: viewModel, deal: deal)
            }
            Spacer()
        }
    }
}

