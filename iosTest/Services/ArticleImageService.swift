//
//  ArticleImageService.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 23/09/23.
//

import Foundation
import SwiftUI
import Combine

class ArticleImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private var article: Article
    
    init(article: Article) {
        self.article = article
        getArticleImage()
    }
    
    private func getArticleImage() {
        guard let url = URL(string: article.urlToImage ?? "") else { return }

        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleComplition, receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
