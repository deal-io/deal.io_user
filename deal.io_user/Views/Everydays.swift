//
//  Everydays.swift
//  deal.io_user
//
//  Created by Tyler Keller on 5/28/23.
//

import SwiftUI

struct Everydays: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel: UserViewModel
    let deals: [Deal]
    
    var body: some View {
        VStack {
            Image(Deal_ioColor.dealio_logo(for: userManager.colorScheme))
                .resizable()
                .frame(width: 200, height: 80)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Deal_ioColor.onBackground(for: UserManager.shared.colorScheme))
                    .frame(width: 225, height: 45)
                Text("Everyday Deals")
                    .font(.title)
                    .foregroundColor(Deal_ioColor.text(for: userManager.colorScheme))
                    .fontWeight(.bold)
            }
            RefreshableScroll(refreshing: self.$viewModel.loading) {
                LazyVStack{
                    ForEach(self.deals, id:\.id) { deal in
                        DealView(viewModel: viewModel, deal: deal, upcoming: false)
                    }
                }
            }
            Rectangle()
                .foregroundColor(Deal_ioColor.background(for: UserManager.shared.colorScheme))
                .edgesIgnoringSafeArea(.all)
                .frame(width: 200, height: 5) 
        }
    }
}
