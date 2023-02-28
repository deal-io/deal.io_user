//
//  DailyFeedViewModel.swift
//  deal.io_customer
//
//  Created by Tyler Keller on 2/21/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    // created synthetic data to figure our view functionality
    // TODO: replace with JSON objects that pull from Firestore using the API
    // TODO: figure out what format the dates will be sent in, completely changes functionality
    @Published var allDeals : [Deal] = [
        Deal(
            dealID: "912ec803b2ce49e4a541068d495ab570",
            restaurantID: "81dc9bdb52d04dc20036dbd8313ed055",
            enterDate: "February 23, 2023 at 09:29:31AM UTC-7",
            dealAttributes: DealAttributes(
                dealName: "25% Off Specialty Burgers",
                restaurantName: "Buffalo Rose",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                daysActive: [false, true, false, false, false, false, false],
                startDate: "February 27, 2023 at 12:00:00AM UTC-7",
                endDate: "February 27, 2023 at 12:00:00AM UTC-7",
                recurring: true
            )
        ),
        Deal(
            dealID: "6677f82a2a18d3a29a3414655d877c50",
            restaurantID: "57bfd3f70b066a6b7c8e59b67393ceb6",
            enterDate: "February 27, 2023 at 12:00:00AM UTC-7",
            dealAttributes: DealAttributes(
                dealName: "BOGO Beers - Study Time",
                restaurantName: "Miner's Saloon",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                daysActive: [false, true, false, false, false, false, false],
                startDate: "February 27, 2023 at 12:00:00AM UTC-7",
                endDate: "February 27, 2023 at 12:00:00AM UTC-7",
                recurring: true
            )
        ),
        Deal(
            dealID: "63a69226faa7bfcc41a75a47e1d89f4b",
            restaurantID: "fa3996112edddfe72acf59b6595625d9",
            enterDate: "February 27, 2023 at 12:00:00AM UTC-7",
            dealAttributes: DealAttributes(
                dealName: "25% Off Tab: Funky Fits",
                restaurantName: "Old Capitol Grill",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                daysActive: [false, true, false, false, false, false, false],
                startDate: "February 27, 2023 at 12:00:00AM UTC-7",
                endDate: "February 27, 2023 at 12:00:00AM UTC-7",
                recurring: true
            )
        ),
        Deal(
            dealID: "63a69226faa7bfcc41a75a47e1d89f4b",
            restaurantID: "fa3996112edddfe72acf59b6595625d9",
            enterDate: "February 27, 2023 at 12:00:00AM UTC-7",
            dealAttributes: DealAttributes(
                dealName: "20% Off Flatbreads",
                restaurantName: "Indulge Wine Bar",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                daysActive: [false, true, false, false, false, false, false],
                startDate: "February 27, 2023 at 12:00:00AM UTC-7",
                endDate: "February 27, 2023 at 12:00:00AM UTC-7",
                recurring: true
            )
        ),
        Deal(
            dealID: "63a69226faa7bfcc41a75a47e1d89f4b",
            restaurantID: "fa3996112edddfe72acf59b6595625d9",
            enterDate: "February 27, 2023 at 12:00:00AM UTC-7",
            dealAttributes: DealAttributes(
                dealName: "$2 Beers",
                restaurantName: "The Golden Mill",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                daysActive: [false, true, false, false, false, false, false],
                startDate: "February 27, 2023 at 12:00:00AM UTC-7",
                endDate: "February 27, 2023 at 12:00:00AM UTC-7",
                recurring: true
            )
        ),
        Deal(
            dealID: "63a69226faa7bfcc41a75a47e1d89f4b",
            restaurantID: "fa3996112edddfe72acf59b6595625d9",
            enterDate: "February 27, 2023 at 12:00:00AM UTC-7",
            dealAttributes: DealAttributes(
                dealName: "10% Off Everything",
                restaurantName: "Buffalo Rose",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                daysActive: [false, true, false, false, false, false, false],
                startDate: "February 27, 2023 at 12:00:00AM UTC-7",
                endDate: "February 27, 2023 at 12:00:00AM UTC-7",
                recurring: true
            )
        ),
        Deal(
            dealID: "912ec803b2ce49e4a541068d495ab570",
            restaurantID: "81dc9bdb52d04dc20036dbd8313ed055",
            enterDate: "February 27, 2023 at 12:00:00AM UTC-7",
            dealAttributes: DealAttributes(
                dealName: "25% Off Specialty Burgers",
                restaurantName: "Bridgewater Grill",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                daysActive: [false, true, false, false, false, false, false],
                startDate: "February 27, 2023 at 12:00:00AM UTC-7",
                endDate: "February 27, 2023 at 12:00:00AM UTC-7",
                recurring: true
            )
        ),
        Deal(
            dealID: "912ec803b2ce49e4a541068d495ab570",
            restaurantID: "81dc9bdb52d04dc20036dbd8313ed055",
            enterDate: "February 27, 2023 at 12:00:00AM UTC-7",
            dealAttributes: DealAttributes(
                dealName: "25% Off Brunch",
                restaurantName: "Cafe 13",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                daysActive: [false, false, false, true, false, false, false],
                startDate: "February 27, 2023 at 12:00:00AM UTC-7",
                endDate: "February 27, 2023 at 12:00:00AM UTC-7",
                recurring: true
            )
        ),
        Deal(
            dealID: "912ec803b2ce49e4a541068d495ab570",
            restaurantID: "81dc9bdb52d04dc20036dbd8313ed055",
            enterDate: "February 27, 2023 at 12:00:00AM UTC-7",
            dealAttributes: DealAttributes(
                dealName: "1/2 Off Burgers",
                restaurantName: "Miner's Saloon",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                daysActive: [false, false, false, true, false, false, false],
                startDate: "February 27, 2023 at 12:00:00AM UTC-7",
                endDate: "February 27, 2023 at 12:00:00AM UTC-7",
                recurring: true
            )
        ),
        Deal(
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
        )
    ]
    
    // definitely not how I'm supposed to do this
    // but I made some of the expected JSON response
    // and turned them into ViewModels with the below
    // function
    @Published var allDealViewModels = [DealViewModel]()
    
    func populateAllDealViewModels() {
        
        for initDeal in self.allDeals {
            allDealViewModels.append(DealViewModel(deal: initDeal))
        }
    }
    
    // below to be uncommented when integrating frontend with backend
    /*
    init() {
        
       fetchDeals()
        
    }
    
    func fetchDeals() {
        DealService().getAllDeals() { deals in
            if let deals = deals {
                self.allDeals = deals.map(DealViewModel.init)
            }
        }
    }
     */
}

extension FeedViewModel {
    
    func createFirestoreDateFormatter() {
        let FirestoreDateFormatter = DateFormatter()
        FirestoreDateFormatter.dateFormat = "M D, Y' at ' HH:mm:ss"
    }
    
    func addDeal(deal: Deal) {
        
        self.allDeals.append(deal)
        
    }
    
}
    
class DealViewModel {
    
    let id = UUID()
    
    var deal: Deal
    
    init(deal: Deal) {
        self.deal = deal
    }
    
    var dealName: String {
        return self.deal.dealAttributes.dealName
    }
    
    var restaurantName: String {
        return self.deal.dealAttributes.restaurantName
    }
    
    var description: String {
        return self.deal.dealAttributes.description
    }
    
    var daysActive: [Bool] {
        return self.deal.dealAttributes.daysActive
    }
    
    var startDate: String {
        return self.deal.dealAttributes.startDate
    }
    
    var endDate: String {
        return self.deal.dealAttributes.endDate
    }
    
    var recurring: Bool {
        return self.deal.dealAttributes.recurring
    }
    
}
