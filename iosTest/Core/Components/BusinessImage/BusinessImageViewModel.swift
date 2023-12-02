//
//  BusinessImageViewModel.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 25/09/23.
//


import Foundation
import SwiftUI
import Combine

class BusinessImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let business: Business
    private let dataService: BusinessImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(business: Business) {
        self.business = business
        self.dataService = BusinessImageService(business: business)
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
