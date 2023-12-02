//
//  PreviewProvider.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 22/09/23.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview() // singleton
    private init() { }
    
    let homeVM = HomeViewModel()
//    let businesVM = BusinessView()
    
    
    let article = Article(
        source:
            Source(
                id: "reuters"),
        author: "Olena Harmash, Tom Balmforth",
        title: "Russia strikes Ukrainian energy facilities in biggest attack in weeks - Reuters",
        description: "Russia carried out its biggest missile attack in weeks across Ukraine on Thursday, pounding energy facilities in what officials said appeared to be the first salvo in a new air campaign against the Ukrainian power grid.",
        urlToImage: "https://www.reuters.com/resizer/JzIEjXdZXWb4VGQ9W6gDoraB26w=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/RUUV5CROL5NYPB434DWAQ2XI2U.jpg",
        publishedAt: "2023-09-21T10:22:04Z",
        content: "KYIV, Sept 21 (Reuters) - Russia carried out its biggest missile attack in weeks across Ukraine on Thursday, pounding energy facilities in what officials said appeared to be the first salvo in a new … [+4212 chars]")
    

    /*
     {
           "source": {
             "id": "usa-today",
             "name": "USA Today"
           },
           "author": "USA TODAY",
           "title": "A high-interest savings account is not out of reach: What to know - USA TODAY",
           "description": null,
           "url": "https://www.usatoday.com/story/money/personalfinance/2023/09/24/savings-account-interest-rates-best-in-years/70922540007/",
           "urlToImage": "https://www.palmbeachpost.com/gcdn/authoring/authoring-images/2023/09/22/NPPP/70931754007-brightline-orlando-station.jpeg?crop=2047,1153,x0,y191&width=2047&height=1153&format=pjpg&auto=webp",
           "publishedAt": "2023-09-24T09:14:55Z",
           "content": null
         }
     */
    let business = Business(
        source:
            BusinessSource(
                id: "reuters"),
        author: "Olena Harmash, Tom Balmforth",
        title: "Russia strikes Ukrainian energy facilities in biggest attack in weeks - Reuters",
        description: "Russia carried out its biggest missile attack in weeks across Ukraine on Thursday, pounding energy facilities in what officials said  appeared to be the first salvo in a new air campaign against the Ukrainian power grid.",
        urlToImage:     "https://www.palmbeachpost.com/gcdn/authoring/authoring-images/2023/09/22/NPPP/70931754007-brightline-orlando-station.jpeg?crop=2047,1153,x0,y191&width=2047&height=1153&format=pjpg&auto=webp",
        publishedAt: "2023-09-21T10:22:04Z",
        content: "KYIV, Sept 21 (Reuters) - Russia carried out its biggest missile attack in weeks across Ukraine on Thursday, pounding energy facilities in what officials said appeared to be the first salvo in a new … [+4212 chars]")


    
    let sport = Sport(
        source:
            SportSource(
                id: "reuters"),
        author: "Olena Harmash, Tom Balmforth",
        title: "Russia strikes Ukrainian energy facilities in biggest attack in weeks - Reuters",
        description: "Russia carried out its biggest missile attack in weeks across Ukraine on Thursday, pounding energy facilities in what officials said  appeared to be the first salvo in a new air  campaign against the Ukrainian power grid.",
        urlToImage: "",
        publishedAt: "2023-09-21T10:22:04Z",
        content: "KYIV, Sept 21 (Reuters) - Russia carried out its biggest  missile attack in weeks across Ukraine on Thursday, pounding energy facilities in what officials said appeared to be the first salvo in a new … [+4212 chars]")
    
}
