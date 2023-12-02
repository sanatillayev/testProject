//
//  ArticleDataService.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 22/09/23.
//

import Foundation
import Combine


class ArticleDataService {
    
    @Published var allArticles: [Article] = []
    var articleSubscription: AnyCancellable?
    
    
    init() {
        getArticles()
    }
    
    func getArticles() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=d2176e261d9b40f2b85a1d0563311eee") else { return }

        articleSubscription = NetworkingManager.download(url: url)
            .sink(receiveCompletion: NetworkingManager.handleComplition, receiveValue: { [weak self] data in
                // Print the received data
                if (String(data: data, encoding: .utf8) != nil) {
                    print("all good")
                } else {
                    print("Received empty data or unable to convert to a string.")
                }

                // Attempt to decode
                do {
                    let postModel = try JSONDecoder().decode(PostModel.self, from: data)
                    self?.allArticles = postModel.articles
                    self?.articleSubscription?.cancel()
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            })
    }

    
}
