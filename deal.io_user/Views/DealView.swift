//
//  DealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

struct DealView: View {
    let dealVM: DealViewModel
    
    var body: some View {
        
        Text("")
        
    }
}

struct DealView_Previews: PreviewProvider {
    static var previews: some View {
        DealView(dealVM: DealViewModel(deal: Deal(
            dealID: "912ec803b2ce49e4a541068d495ab570",
            restaurantID: "81dc9bdb52d04dc20036dbd8313ed055",
            enterDate: "February 27, 2023 at 12:00:00AM UTC-7",
            dealAttributes: DealAttributes(
                dealName: "$2 Patio Beers",
                restaurantName: "Old Capitol Grill",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                daysActive: [false, false, false, true, false, false, false],
                startDate: "February 27, 2023 at 12:00:00AM UTC-7",
                endDate: "February 27, 2023 at 12:00:00AM UTC-7",
                recurring: true
            )
        )))
    }
}
