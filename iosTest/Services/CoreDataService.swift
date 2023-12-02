//
//  CoreDataService.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 24/09/23.
//

import Foundation
import CoreData


class CoreDataService {
    
    private let container: NSPersistentContainer
    private let containerName: String = "ArticleContainer"
    private let entityName: String = "ArticleEntity"
    
    @Published var savedEntities: [ArticleEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading core data \(error)")
            }
            self.getArticle()
        }
    }
    
    // MARK: PUBLIC
    
    func updateArticle(article: Article) {
       
            // Check if the article is not already saved
            if savedEntities.first(where: { $0.id == article.source.id }) == nil {
                add(article: article)
                print("data saved")
            }
        
    }
    
    
    // MARK: PRIVATE
    
    private func getArticle() {
        let request = NSFetchRequest<ArticleEntity>(entityName: entityName)
        do {
           savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching Article Entities \(error)")
        }
    }
    
    private func add(article: Article) {
        let entity = ArticleEntity(context: container.viewContext)
        entity.id = article.source.id
        entity.author = article.author
        entity.content = article.content
        entity.descrip = article.description
        entity.image = article.urlToImage
        entity.title = article.title
        applyChanges() 
    }
    
    private func delete(entity: ArticleEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to core data \(error )")
        }
    }
    
    private func applyChanges() {
        save()
        getArticle()
    }
    
}
