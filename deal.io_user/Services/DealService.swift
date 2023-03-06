//
//  DealService.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/27/23.
//

import Foundation

// The below class is to be connected to the main API when backend is set up and call can be made
class DealService {
    
    // make the API call to grab all deals from the database
    func createCoffeeOrder(deal: Deal, completion: @escaping (CreateDealResponse?) -> ()) {
        
        guard let url = URL(string: "https://dealio-backend-production.web.app/deal") else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // can only call encode on struct order because it's a Codable type
        request.httpBody = try? JSONEncoder().encode(deal)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let createOrderResponse = try? JSONDecoder().decode(CreateDealResponse.self, from: data)
            DispatchQueue.main.async {
                completion(createOrderResponse)
            }
        }.resume()
    }
    
    func getAllOrders(completion: @escaping ([Deal]?) -> ()) {
        
        guard let url = URL(string: "https://dealio-backend-production.web.app/deal") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let orders = try? JSONDecoder().decode([Deal].self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
            
        }.resume()
    }
}
