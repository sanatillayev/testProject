//
//  NewsImageView.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 23/09/23.
//

import SwiftUI



struct ArticleImageView: View {
    
    @StateObject  var vm: ArticleImageViewModel
    
    init(article: Article) {
        _vm = StateObject(wrappedValue: ArticleImageViewModel(article: article))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            }else if vm.isLoading {
                ProgressView()
            }else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct ArticleImageView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleImageView(article: dev.article)
            .previewLayout(.sizeThatFits)
            .padding( )
    }
}
