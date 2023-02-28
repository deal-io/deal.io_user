//
//  DailyFeedView.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import SwiftUI

struct DailyFeedView: View {
    let deals: [DealViewModel]
    
    var body: some View {
        List {
            ForEach(self.deals, id:\.id) { deal in
                HStack {
                    VStack {
                        Text(deal.dealName)
                            .font(.title)
                            .padding([.leading, .bottom], 10)
                        HStack {
                            Text(deal.restaurantName)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                            Text(deal.startDate)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

