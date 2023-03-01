//
//  BasicDeal.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/28/23.
//

import Foundation

struct BasicDeal: Hashable{
    
    var dealName: String
    var restaurantName: String
    var description: String
    var hoursToEnd: Int
    var hoursToStart: Int
    
    init(dealName: String, restaurantName: String, description: String, hoursToEnd: Int, hoursToStart: Int) {
        self.dealName = dealName
        self.restaurantName = restaurantName
        self.description = description
        self.hoursToEnd = hoursToEnd
        self.hoursToStart = hoursToStart
    }
}


func getAllBasicDeals() -> [BasicDeal] {
    return [
        BasicDeal(
            dealName: "25% Off Specialty Burgers",
            restaurantName: "Buffalo Rose",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
            hoursToEnd: 6,
            hoursToStart: 2
        ),
        BasicDeal(
            dealName: "25% Off Specialty Burgers",
            restaurantName: "Buffalo Rose",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
            hoursToEnd: 6,
            hoursToStart: 2
        ),
        BasicDeal(
            dealName: "25% Off Specialty Burgers",
            restaurantName: "Buffalo Rose",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
            hoursToEnd: 6,
            hoursToStart: 2
        ),
        BasicDeal(
            dealName: "25% Off Specialty Burgers",
            restaurantName: "Buffalo Rose",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
            hoursToEnd: 6,
            hoursToStart: 2
        ),
        BasicDeal(
            dealName: "25% Off Specialty Burgers",
            restaurantName: "Buffalo Rose",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
            hoursToEnd: 6,
            hoursToStart: 2
        ),
        BasicDeal(
            dealName: "25% Off Specialty Burgers",
            restaurantName: "Buffalo Rose",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
            hoursToEnd: 6,
            hoursToStart: 2
        ),
        BasicDeal(
            dealName: "25% Off Specialty Burgers",
            restaurantName: "Buffalo Rose",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
            hoursToEnd: 6,
            hoursToStart: 2
        ),
        BasicDeal(
            dealName: "25% Off Specialty Burgers",
            restaurantName: "Buffalo Rose",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
            hoursToEnd: 6,
            hoursToStart: 2
        ),
        BasicDeal(
            dealName: "25% Off Specialty Burgers",
            restaurantName: "Buffalo Rose",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
            hoursToEnd: 6,
            hoursToStart: 2
        ),
        BasicDeal(
            dealName: "25% Off Specialty Burgers",
            restaurantName: "Buffalo Rose",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu augue rutrum, pellentesque enim at, congue ipsum. Pellentesque fermentum iaculis vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
            hoursToEnd: 6,
            hoursToStart: 2
        )
    ]
}
