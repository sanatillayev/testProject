//
//  BusinessView.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 25/09/23.
//

import SwiftUI

struct BusinessView: View {
    
    @StateObject private var bvm: BusinessViewModel
    
    init(vm: BusinessViewModel) {
        self._bvm = StateObject(wrappedValue: vm)
        print("initializes business view model")
    }
//
    var body: some View {
        ZStack {
            
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack() {
                allArticlesList
            }
            .navigationTitle("Business")
        }
    }
}

struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BusinessView(vm: BusinessViewModel())
                .toolbar(.visible, for: .navigationBar)
        }
//        .environmentObject(dev.businesVM)

    }
}

extension BusinessView {
    
    private var allArticlesList: some View {
        List {
            ForEach(bvm.allBusinessArticles, id: \.source.id) { business in
                BusinessRawView(business: business)
            }
        }
        .listStyle(.plain)
    }
}
