//
//  ScoreViewModel.swift
//  MorseTeacher
//
//  Created by Francesco Bernaudo on 11/05/23.
//

import Foundation

class ScoreVM: ObservableObject {
    @Published var score: Int
    
    init(){
        self.score = 0
    }
}
