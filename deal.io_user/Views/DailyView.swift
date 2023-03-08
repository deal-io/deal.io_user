//
//  DailyView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/28/23.
//

import SwiftUI

struct DailyView: View {
    let deals: [Deal]
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(self.deals, id:\.id) { deal in
                    DealView(dealVM: DealViewModel(deal: deal))
                }
            }
        }
        .background(Deal_ioColor.background)
        .listRowSeparator(.hidden)
    }
}

