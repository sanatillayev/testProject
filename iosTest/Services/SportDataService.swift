//
//  SportDataService.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 26/09/23.
//

import Foundation
import Combine


class SportDataService {
    
    @Published var allSportArticles: [Sport] = []
    var sportSubscription: AnyCancellable?
    
    
    init() {
        getSportArticles()
    }
    
    func getSportArticles() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?category=sports&apiKey=d2176e261d9b40f2b85a1d0563311eee") else { return }

        sportSubscription = NetworkingManager.download(url: url)
            .sink(receiveCompletion: NetworkingManager.handleComplition, receiveValue: { [weak self] returnedSports in
                // Print the received data
                if (String(data: returnedSports, encoding: .utf8) != nil) {
                    print("all good")
//                    print(returnedSports)
                } else {
                    print("Received empty data or unable to convert to a string.")
//                    print(returnedSports)

                }

                // Attempt to decode
                do {
                    let sportModel = try JSONDecoder().decode(SportModel.self, from: returnedSports)
                    self?.allSportArticles = sportModel.articles
                    self?.sportSubscription?.cancel()
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            })
    }

    
}
