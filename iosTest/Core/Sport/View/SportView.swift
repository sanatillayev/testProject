//
//  SportView.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 26/09/23.
//

import SwiftUI

struct SportView: View {
    
    @StateObject private var svm: SportViewModel
    
    init(vm: SportViewModel) {
        self._svm = StateObject(wrappedValue: vm)
        print("initialized sport view model")
    }
    
    var body: some View {
        ZStack {
            
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack() {
                allArticlesList
            }
            .navigationTitle("Sport")
        }
    }
}

struct SportView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SportView(vm: SportViewModel())
                .toolbar(.visible, for: .navigationBar)
        }
//        .environmentObject(dev._)

    }
}


extension SportView {
    
    private var allArticlesList: some View {
        List {
            ForEach(svm.allSportArticles, id: \.source.id) { sport in
                SportRawView(sport: sport)
            }
        }
        .listStyle(.plain)
    }
}
