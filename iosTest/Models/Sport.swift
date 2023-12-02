//
//  Sport.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 26/09/23.
//

// API
// URL: https://newsapi.org/v2/top-headlines?category=sports&apiKey=d2176e261d9b40f2b85a1d0563311eee
// JSON Response
/*
 {
       "source": {
         "id": "google-news",
         "name": "Google News"
       },
       "author": "Kleine Zeitung",
       "title": "Skilegende in Spielberg - Marcel Hirscher: \"Im Nachhinein betrachtet ist es ein hoher Preis, den ich nach wie vor zahle\" - Kleine Zeitung",
       "description": null,
       "url": "https://news.google.com/rss/articles/CBMigAFodHRwczovL3d3dy5rbGVpbmV6ZWl0dW5nLmF0L3Nwb3J0L3dpbnRlcnNwb3J0L3NraWFscGluLzYzMjQ5MDUvU2tpbGVnZW5kZS1pbi1TcGllbGJlcmdfTWFyY2VsLUhpcnNjaGVyX0ltLU5hY2hoaW5laW4tYmV0cmFjaHRldNIBAA?oc=5",
       "urlToImage": null,
       "publishedAt": "2023-09-25T04:00:00Z",
       "content": null
     }
 */

import Foundation

struct SportModel: Codable {
    let articles: [Sport]
    
    enum CodingKeys: String, CodingKey {
            case articles
    }
}

struct Sport: Codable {
    let source: SportSource
    let author: String? // optional
    let title: String?
    let description: String? // optional
    let urlToImage: String? // optional
    let publishedAt: String
    let content: String? // optional
    
    enum CodingKeys: String, CodingKey {
            case source
            case author
            case title
            case description
            case urlToImage
            case publishedAt
            case content
        }
}

struct SportSource: Identifiable, Codable {
    let id: String?  // optional
    
    enum CodingKeys: String, CodingKey {
            case id
    }
}

