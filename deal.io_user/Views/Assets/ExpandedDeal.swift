//
//  ExpandedDealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

struct ExpandedDeal: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel: UserViewModel
    
    @State private var yelpBusiness: Business?
    @State private var selection: Int = 0
    var deal: Deal
    @Binding var isPickerTapped: Bool

    
    var body: some View {
        VStack{
            Spacer()
            
            Text(deal.dealAttributes.dealName)
                .font(.title)
                .multilineTextAlignment(.center)
            
            HStack {
                Button(action: { selection = 0 }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(selection == 0 ? Deal_ioColor.selected(for: userManager.colorScheme): Deal_ioColor.unselected(for: userManager.colorScheme))
                            .frame(width: 90, height: 30)
                        Text("Deal Info")
                            .foregroundColor(Deal_ioColor.text(for: userManager.colorScheme))
                            .padding(5)
                    }
                }
                Button(action: { selection = 1 }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(selection == 1 ? Deal_ioColor.selected(for: userManager.colorScheme): Deal_ioColor.unselected(for: userManager.colorScheme))
                            .frame(width: 130, height: 30)
                        Text("Restaurant Info")
                            .foregroundColor(Deal_ioColor.text(for: userManager.colorScheme))
                            .padding(5)
                    }
                }
            }
            .background(Deal_ioColor.unselected(for: UserManager.shared.colorScheme)).cornerRadius(10)
            .padding(.trailing, 60)
            .padding(.leading, 60)
            .padding(.bottom, 10)
            .onTapGesture {
                isPickerTapped = true
            }

            if selection == 0 {
                DealInfo(viewModel: viewModel, deal: deal)
            } else if selection == 1 {
                RestaurantInfo(viewModel: viewModel, deal: deal, yelpBusiness: yelpBusiness)
            }
                
            Spacer()
        }
        .onAppear {
            Task {
                do {
                    let businesses = try await YelpAPI.searchBusinesses(name: viewModel.nameMap[deal.restaurantID] ?? "", address: viewModel.locationMap[deal.restaurantID] ?? "")
                    // Assuming the Yelp search API returns multiple businesses for a given address,
                    // you might want to select the most relevant one here. For simplicity, we're just
                    // taking the first one.
                    if let firstBusiness = businesses.first {
                        self.yelpBusiness = firstBusiness
                    }
                } catch {
                    print("Failed to fetch Yelp business info: \(error)")
                }
            }
        }
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Deal_ioColor.expandedDeal(for: UserManager.shared.colorScheme))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .padding(.horizontal, 2)
                .padding(.vertical, 2)
        )
        .foregroundColor(Deal_ioColor.symbol(for: userManager.colorScheme))
        .overlay(
            HStack{
                StarButton(viewModel: viewModel, deal: deal)
                    .padding(.leading, 15)
                    .padding(.top, 20)
                Spacer()
                Button(action: {
                    let appURL = "https://apps.apple.com/app/id6446871125"
                    let shareText = "\(appURL)\nCheck out this deal at \(String(describing: viewModel.nameMap[deal.restaurantID]!)): \(deal.dealAttributes.dealName)"
                    let activityController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
                    UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)
                    logDealShareEvent(viewModel: viewModel, deal: deal)
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(Deal_ioColor.symbol(for: userManager.colorScheme))
                        .padding(.trailing, 25)
                        .padding(.top, 20)
                }
            },
            alignment: .topLeading
        )
    }
}



