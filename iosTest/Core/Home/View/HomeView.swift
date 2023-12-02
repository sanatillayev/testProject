//
//  HomeView.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 22/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var vm : HomeViewModel
    
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack() {
                SearchBarView(searchText: $vm.searchText)
                
                allArticlesList
                
            }
            .navigationTitle("News")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            HomeView()
//                .toolbar(.visible, for: .navigationBar)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    
    private var allArticlesList: some View {
        List {
            ForEach(vm.savedArticles, id: \.source.id) { article in
                NewsRawView(article: article)
                // to save data
//                    .onTapGesture {
//                        vm.saveArticle(article: article)
//                        print("pressed to save")
//                        print("\(vm.savedArticles.count)")
//                    }
            }
            
        }
        .listStyle(.plain)
    }
}
