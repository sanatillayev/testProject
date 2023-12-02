//
//  BusinessImageView.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 25/09/23.
//

import SwiftUI

struct BusinessImageView: View {
    
    @StateObject var vm: BusinessImageViewModel
    
    init(business: Business) {
        _vm = StateObject(wrappedValue: BusinessImageViewModel(business: business))
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

struct BusinessImageView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessImageView(business: dev.business)
            .previewLayout(.sizeThatFits)
            .padding( )
    }
}

