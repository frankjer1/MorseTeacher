//
//  TutorialView.swift
//  MorseTeacher
//
//  Created by Francesco Bernaudo on 11/05/23.
//

import SwiftUI

struct TutorialView: View {
    var morseAlphabet = MorseAlphabet()
    var body: some View {
        HStack{
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(Array(morseAlphabet.alphabet.keys.sorted(by: {morseAlphabet.alphabet[$0]! < morseAlphabet.alphabet[$1]!}).enumerated()), id: \.element){_ , key in
                        Text("\(morseAlphabet.alphabet[key] ?? "Error")  :  \(key)")
                            .font(.title3)
                            .fontDesign(.monospaced)
                    }
                }
            }
            Spacer()
        }
        .padding(.all, 30)
        .scrollIndicators(.hidden)
            .navigationTitle("Morse Alphabet")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
