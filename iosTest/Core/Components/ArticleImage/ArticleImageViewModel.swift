//
//  ArticleImageViewModel.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 23/09/23.
//

import Foundation
import SwiftUI
import Combine

class ArticleImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let article: Article
    private let dataService: ArticleImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(article: Article) {
        self.article = article
        self.dataService = ArticleImageService(article: article)
        addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
