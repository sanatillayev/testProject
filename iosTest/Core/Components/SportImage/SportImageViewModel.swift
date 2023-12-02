//
//  SportImageViewModel.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 26/09/23.
//

import Foundation
import SwiftUI
import Combine

class SportImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let sport: Sport
    private let dataService: SportImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(sport: Sport) {
        self.sport = sport
        self.dataService = SportImageService(sport: sport)
        addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
