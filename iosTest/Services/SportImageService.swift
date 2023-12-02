//
//  SportImageService.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 26/09/23.
//

import Foundation
import SwiftUI
import Combine

class SportImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private var sport: Sport
    
    init(sport: Sport) {
        self.sport = sport
        getSportImage()
    }
    
    private func getSportImage() {
        guard let url = URL(string: sport.urlToImage ?? "") else { return }

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
