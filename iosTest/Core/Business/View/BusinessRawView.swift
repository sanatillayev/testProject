//
//  BusinessRawView.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 25/09/23.
//

import SwiftUI

struct BusinessRawView: View {
    let business: Business
    
    var body: some View {
        HStack {
            textColumn
            image
        }
    }
}

struct BusinessRawView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessRawView(business: dev.business)
    }
}

extension BusinessRawView {
    private var textColumn: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(business.title ?? "")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.accent)
                .lineLimit(3)
                .truncationMode(.tail)
                
            Text(business.description ?? "")
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(Color.theme.secondaryText)
                .lineLimit(2)
                .truncationMode(.tail)
        }
    }
    
    private var image: some View {
        BusinessImageView(business: business)
            .frame(width: 130, height: 130)
            .cornerRadius(10)
    }
}

