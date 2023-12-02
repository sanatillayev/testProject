//
//  BusinessDataService.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 25/09/23.
//

import Foundation
import Combine


class BusinessDataService {
    
    @Published var allBusinessArticles: [Business] = []
    var businessSubscription: AnyCancellable?
    
    
    init() {
        getBusinessArticles()
    }
    
    func getBusinessArticles() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d2176e261d9b40f2b85a1d0563311eee") else { return }

        businessSubscription = NetworkingManager.download(url: url)
            .sink(receiveCompletion: NetworkingManager.handleComplition, receiveValue: { [weak self] returnedBusinesses in
                // Print the received data
                if (String(data: returnedBusinesses, encoding: .utf8) != nil) {
                    print("all good")
//                    print(returnedBusinesses)
                } else {
                    print("Received empty data or unable to convert to a string.")
//                    print(returnedBusinesses)

                }

                // Attempt to decode
                do {
                    let businesModel = try JSONDecoder().decode(BusinessModel.self, from: returnedBusinesses)
                    self?.allBusinessArticles = businesModel.articles
                    self?.businessSubscription?.cancel()
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            })
    }

    
}
