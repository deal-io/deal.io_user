//
//  DailyView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/28/23.
//

import SwiftUI

struct DailyView: View {
    @ObservedObject var feedViewModel: FeedViewModel
    let deals: [Deal]
    
    init(feedViewModel: FeedViewModel) {
        self.feedViewModel = feedViewModel
        self.deals = feedViewModel.getDailyDeals()!
    }
    
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

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView(feedViewModel: FeedViewModel())
    }
}
