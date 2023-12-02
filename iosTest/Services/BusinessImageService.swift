//
//  BusinessImageService.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 25/09/23.
//

import Foundation
import SwiftUI
import Combine

class BusinessImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private var business: Business
    
    init(business: Business) {
        self.business = business
        getBusinessImage()
    }
    
    private func getBusinessImage() {
        guard let url = URL(string: business.urlToImage ?? "") else { return }

        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleComplition, receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
