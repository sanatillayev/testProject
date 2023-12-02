//
//  SportImageView.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 26/09/23.
//

import SwiftUI

struct SportImageView: View {
    @StateObject var vm: SportImageViewModel
    
    init(sport: Sport) {
        _vm = StateObject(wrappedValue: SportImageViewModel(sport: sport))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            }else if vm.isLoading {
                ProgressView()
            }else if vm.image == nil {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct SportImageView_Previews: PreviewProvider {
    static var previews: some View {
        SportImageView(sport: dev.sport)
            .previewLayout(.sizeThatFits)
            .padding( )
    }
}
