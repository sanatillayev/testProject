//
//  NewsRawView.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 22/09/23.
//

import SwiftUI

struct NewsRawView: View {
    
    @EnvironmentObject var vm : HomeViewModel
    
    let article: Article
    
    var body: some View {
        HStack {
            textColumn
            image
        }
        
    }
}

struct NewsRawView_Previews: PreviewProvider {
    static var previews: some View {
        NewsRawView(article: dev.article)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

extension NewsRawView {
    private var textColumn: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(article.title ?? "")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.accent)
                .lineLimit(3)
                .truncationMode(.tail)
                
            Text(article.description ?? "")
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(Color.theme.secondaryText)
                .lineLimit(2)
                .truncationMode(.tail)
        }
    }
    
    private var image: some View {
        ArticleImageView(article: article)
            .frame(width: 130, height: 130)
            .cornerRadius(10)
    }
}
