//
//  MorseTeacherApp.swift
//  MorseTeacher
//
//  Created by Francesco Bernaudo on 20/04/23.
//

import SwiftUI

@main
struct MorseTeacherApp: App {
    @StateObject var score = ScoreVM()
    var body: some Scene {
        WindowGroup {
            QuizView()
                .environmentObject(score)
        }
    }
}
