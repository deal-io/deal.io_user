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
                Picker("Sort by", selection: $selectedSortType) {
                    Text("Default").tag(DailySortType.DEFAULT)
                    Text("Active").tag(DailySortType.ACTIVE)
                    Text("Ended").tag(DailySortType.ENDED)
                    Text("Start: High-Low").tag(DailySortType.START_ASC)
                    Text("Start: Low-High").tag(DailySortType.START_DEC)
                    Text("End: High-Low").tag(DailySortType.END_ASC)
                    Text("End: Low-High").tag(DailySortType.END_DEC)
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
