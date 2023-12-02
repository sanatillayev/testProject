//
//  SportViewModel.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 26/09/23.
//

import Foundation
import Combine

class SportViewModel: ObservableObject {
    
    @Published var allSportArticles: [Sport] = []
        
    
    private var sportDataService = SportDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        // updates the allSportArticles
        sportDataService.$allSportArticles
            .sink { [weak self] returnedSport in
                self?.allSportArticles = returnedSport
                print("received sport articles")
                print(returnedSport)
            }
            .store(in: &cancellables)
        
    }
    
    
}
