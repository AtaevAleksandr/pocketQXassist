//
//  PairViewModel.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 16.01.2024.
//

import Foundation

final class PairViewModel: ObservableObject {

    @Published var allPairs: [PairModel] = PairModel.pairs
}
