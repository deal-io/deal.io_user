//
//  YelpAPI.swift
//  deal.io_user
//
//  Created by Tyler Keller on 6/23/23.
//

import Foundation

struct SearchResponse: Codable {
    let businesses: [Business]
}

struct Business: Codable {
    let name: String
    let reviewCount: Int
    let rating: Double
    let imageUrl: String
    let price: String

    enum CodingKeys: String, CodingKey {
        case name
        case reviewCount = "review_count"
        case rating
        case imageUrl = "image_url"
        case price
    }
}

struct YelpAPI {
    static let apiKey = "0h_UKGZ7HLxLMV6kN6SxdoMrdrxVQXXsiIU13qwrdUHRuX6wt4MLyqPZkbFQJ5qcG2LrGfwVtNPmUaHGa8FAy9pqAH5q6_ZBFEbcaQcetR5CLY-6GqtPPBQ_eSaWZHYx"
    
        
    static func searchBusinesses(name: String, address: String) async throws -> [Business] {
        guard let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let encodedAddress = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("YELPAPI: Failed to encode name or address for \(name)")
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to encode name or address"])
        }
        let urlString = "https://api.yelp.com/v3/businesses/search?term=\(encodedName)&location=\(encodedAddress)&radius=1000"
        guard let url = URL(string: urlString) else {
            print("YELPAPI: Invalid URL for \(name)")
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
        print("YELPAPI: \(searchResponse.businesses)")
        return searchResponse.businesses
    }

}
