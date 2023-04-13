//
//  DailyFilterButton.swift
//  deal.io_user
//
//  Created by Levi Ortega on 4/5/23.
//

import Foundation
import SwiftUI
struct DailySortButton: View {
    @ObservedObject var viewModel: UserViewModel
    
    @State private var selectedSortType: DailySortType

    
    init(viewModel: UserViewModel){
        self.viewModel = viewModel
        self.selectedSortType = viewModel.dailySortType
    }
    
    var body: some View {
       
            Menu{
                Picker("Filter by", selection: $selectedSortType) {
                    Text("None").tag(DailySortType.NONE)
                    Text("Active").tag(DailySortType.ACTIVE)
                    Text("Upcoming").tag(DailySortType.UPCOMING)
                    Text("Ended").tag(DailySortType.ENDED)
                    
                }
                
            }label: {
                Image(systemName: "arrow.up.arrow.down")
                    .padding(10)
                    .background(Deal_ioColor.onBackground)
                    .foregroundColor(.blue)
                    .clipShape(Circle())
            }
        
            .onChange(of: selectedSortType) { newValue in
                viewModel.dailySortType = newValue
            }
            .padding(5)
        
        }
        
    
}
