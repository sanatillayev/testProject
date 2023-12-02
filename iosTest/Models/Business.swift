//
//  Business.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 25/09/23.
//

// API
// URL: https://newsapi.org/v2/top-headlines?category=business&apiKey=30bab526ed854fdc815c2aa02f19a53e
// JSON Response
/*
 {
   "status": "ok",
   "totalResults": 37,
   "articles": [
     {
       "source": {
         "id": "reuters", // optional
         "name": "Reuters"  // not optional
       },
       "author": "Olena Harmash, Tom Balmforth",
       "title": "Russia strikes Ukrainian energy facilities in biggest attack in weeks - Reuters",
       "description": "Russia carried out its biggest missile attack in weeks across Ukraine on Thursday, pounding energy facilities in what officials said appeared to be the first salvo in a new air campaign against the Ukrainian power grid.",
       "url": "https://www.reuters.com/world/europe/blasts-heard-kyiv-other-parts-ukraine-2023-09-21/",
       "urlToImage": "https://www.reuters.com/resizer/JzIEjXdZXWb4VGQ9W6gDoraB26w=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/RUUV5CROL5NYPB434DWAQ2XI2U.jpg",
       "publishedAt": "2023-09-21T10:22:04Z",
       "content": "KYIV, Sept 21 (Reuters) - Russia carried out its biggest missile attack in weeks across Ukraine on Thursday, pounding energy facilities in what officials said appeared to be the first salvo in a new … [+4212 chars]"
     }
   ]
 }
 */

import Foundation

struct BusinessModel: Codable {
    let articles: [Business]
    
    enum CodingKeys: String, CodingKey {
            case articles
    }
}

struct Business: Codable {
    let source: BusinessSource
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

struct BusinessSource: Identifiable, Codable {
    let id: String?  // optional
    
    enum CodingKeys: String, CodingKey {
            case id
    }
}

