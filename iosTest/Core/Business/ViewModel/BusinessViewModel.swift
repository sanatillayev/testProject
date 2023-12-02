//
//  BusinessViewModel.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 25/09/23.
//

import Foundation
import Combine

class BusinessViewModel: ObservableObject {
    
    @Published var allBusinessArticles: [Business] = []
        
    
    private var businessDataService = BusinessDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        // updates the allBusinessArticles
        businessDataService.$allBusinessArticles
            .sink { [weak self] returnedBusiness in
                self?.allBusinessArticles = returnedBusiness
                print("received business articles")
                print(returnedBusiness)
            }
            .store(in: &cancellables)
        
    }
    
    
}
