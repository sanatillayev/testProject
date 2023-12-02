//
//  HomeViewModel.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 22/09/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allArticles: [Article] = []
    
    @Published var savedArticles: [Article] = []
    
    @Published var searchText: String = ""
    
    
    private var dataService = ArticleDataService()
    private let coreDataService = CoreDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        

        // updates the allArticles
        $searchText
            .combineLatest(dataService.$allArticles)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterArticles)
            .sink { [weak self] returnedArticles in
                self?.allArticles = returnedArticles
            }
            .store(in: &cancellables)
        
        // updates savedArticles  ?
        $allArticles
            .combineLatest(coreDataService.$savedEntities)
            .map { (articles, articleEntities) -> [Article] in
                articles.map { article in
                    if let _ = articleEntities.first(where: { $0.id == article.source.id }) {
                        // Article exists in articleEntities, keep it
                        return article
                    } else {
                        // Article doesn't exist in articleEntities, add it
                        self.coreDataService.updateArticle(article: article)
                        return article
                    }
                }
            }
            .sink { [weak self] updatedArticles in
                self?.savedArticles = updatedArticles
            }
            .store(in: &cancellables)
    }
    
    func saveArticle(article: Article) {
            coreDataService.updateArticle(article: article)
    }

    
    private func filterArticles(text: String, articles: [Article]) -> [Article] {
        guard !text.isEmpty else {
            return articles
        }
        let lowercasedText = text.lowercased()
        return articles.filter { article in
            return ((article.title?.lowercased().contains(lowercasedText)) != false) ||
            ((article.description?.lowercased().contains(lowercasedText)) != false) // ||
//            ((article.content?.lowercased().contains(lowercasedText)) != false)
        }
    }
}
