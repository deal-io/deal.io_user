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
    func getAllActiveDeals(completion: @escaping ([Deal]?) -> ()) {
        
        guard let url = URL(string: "https://dealio-backend-production.web.app/deal/active") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let deals = try? JSONDecoder().decode([Deal].self, from: data)
            DispatchQueue.main.async {
                completion(deals)
            }
            
        }.resume()
    }
}
