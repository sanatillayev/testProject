//
//  SportRawView.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 26/09/23.
//

import SwiftUI

struct SportRawView: View {
    let sport: Sport
    
    var body: some View {
        HStack {
            textColumn
            image
        }
    }
}

struct SportRawView_Previews: PreviewProvider {
    static var previews: some View {
        SportRawView(sport: dev.sport)
    }
}

extension SportRawView {
    private var textColumn: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(sport.title ?? "")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.accent)
                .lineLimit(3)
                .truncationMode(.tail)
                
            Text(sport.description ?? "")
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(Color.theme.secondaryText)
                .lineLimit(2)
                .truncationMode(.tail)
        }
    }
    
    private var image: some View {
        SportImageView(sport: sport)
            .frame(width: 130, height: 130)
            .cornerRadius(10)
    }
}

