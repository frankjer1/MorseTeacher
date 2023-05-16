//
//  SettingsView.swift
//  MorseTeacher
//
//  Created by Francesco Bernaudo on 11/05/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var score: ScoreVM
    @State var isShowingAlert: Bool = false
    var body: some View {
        List{
            Section{
                NavigationLink(destination: AboutView(), label: {Text("About")})
                NavigationLink(destination: InstructionsView(), label: {Text("Istructions")})
            }
            Section{
                Button("Reset Score", action: {isShowingAlert = true})
                    .foregroundColor(.red)
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Do you want to reset the score?"), primaryButton: .destructive(Text("No")), secondaryButton: .default(Text("Yes"), action: {score.score = 0}))
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(ScoreVM())
    }
}
