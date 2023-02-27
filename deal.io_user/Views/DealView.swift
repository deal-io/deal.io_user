//
//  DealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

struct DealView: View {
    
    let deal = Deal(
        deal_id: "abc",
        restaurant_id: "123",
        enter_date: Date(),
        deal_title: "10% Off Our Entire Menu",
        restaurant_name: "Old Capitol Grill",
        description: "Come on down to Old Capitol Grill for 10% off our entire menu! Just show your student ID at the door to redeem this deal!",
        days: [true, false, false, true, false, false, true],
        start_date: Date(timeIntervalSinceNow: 100),
        end_date: Date(timeIntervalSinceNow: 10000),
        isRecurring: false,
        isActive: true)
    
    var body: some View {
        VStack {
            Spacer()
            Text(deal.deal_title)
                .font(.title2)
            HStack {
                Spacer()
                Text("0.5 mi")
                Spacer()
                Text(deal.restaurant_name)
                Spacer()
                Text("\(deal.hours)")
                Spacer()
            }
            Spacer()
        }
    }
}

struct DealView_Previews: PreviewProvider {
    static var previews: some View {
        DealView()
    }
}
