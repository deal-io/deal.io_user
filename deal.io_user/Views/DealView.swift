//
//  DealView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/25/23.
//

import SwiftUI

struct DealView: View {
    let basicDealVM: BasicDealViewModel
    
    var body: some View {
        VStack{
                Spacer()
            Text(basicDealVM.dealName)
                .font(.title)
                .foregroundColor(.white)
                .padding(.horizontal, 4.5)
                .multilineTextAlignment(.center)
            
            HStack {
                Spacer()
                Text("0.5 mi")
                Spacer()
                Text(basicDealVM.restaurantName)
                .padding(3)
                Spacer()
                if (basicDealVM.active) {
                    Text("\(basicDealVM.hoursToEnd)")
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                .padding(3)
                } else {
                    Text("\(basicDealVM.hoursToStart) hrs")
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        .background(Deal_ioColor.oneHourColor)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                .padding(3)
                }
                Spacer()
            }
                Spacer()
        }
        .background(Deal_ioColor.background)
        .foregroundColor(.white)
        
    }
}

struct DealView_Previews: PreviewProvider {
    static var previews: some View {
        DealView(basicDealVM: BasicDealViewModel(basicDeal: BasicDeal(
            dealName: "25% Off Specialty Burgers",
            restaurantName: "Buffalo Rose",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
            hoursToEnd: 6,
            hoursToStart: 2
        )
        )
        )
    }
}
