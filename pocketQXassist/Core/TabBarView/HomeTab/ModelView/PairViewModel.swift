//
//  PairViewModel.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 16.01.2024.
//

import Foundation


final class PairViewModel: ObservableObject {

    @Published var allPairs: [PairModel] = PairModel.pairs

    func updatePairs() {
        for index in allPairs.indices {
            let randomValueChange = CGFloat.random(in: -1...1)
            
            allPairs[index].value += randomValueChange
            allPairs[index].value = max(1, min(allPairs[index].value, 9))
        }
        objectWillChange.send()
    }
}
