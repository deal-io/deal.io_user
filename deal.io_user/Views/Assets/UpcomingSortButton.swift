//
//  UpcomingSortButton.swift
//  deal.io_user
//
//  Created by Levi Ortega on 4/5/23.
//

import Foundation
import SwiftUI

struct UpcomingSortButton: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel: UserViewModel
    
    @State private var isFiltering = false
    @State private var selectedSortType: UpcomingSortType
    
    init(viewModel: UserViewModel){
        self.viewModel = viewModel
        self.selectedSortType = viewModel.upcomingSortType
    }
    
    var body: some View {
        
             Menu{
                 Picker("Sort by", selection: $selectedSortType) {
                     Text("Week: Start-End").tag(UpcomingSortType.DAY_ASC)
                     Text("Week: End-Start").tag(UpcomingSortType.DAY_DEC)
                     
                 }
                 
             }label: {
                 Image(systemName: "slider.horizontal.3")
                     .padding(10)
                     .background(Deal_ioColor.onBackground(for: UserManager.shared.colorScheme))
                     .foregroundColor(.white)
                     .clipShape(Circle())
             }
            
             .onChange(of: selectedSortType) { newValue in
                 viewModel.upcomingSortType = newValue
             }
             .padding(5)
         
         }
    
}



