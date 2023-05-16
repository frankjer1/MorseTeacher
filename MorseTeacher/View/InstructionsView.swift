//
//  InstructionsView.swift
//  MorseTeacher
//
//  Created by Francesco Bernaudo on 11/05/23.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
            VStack{
                ScrollView{
                    Text("Hello Everyone and welcome into MorseTeacher! Please follow the following instructions to have the best experience with this app.\n\nIn the main page you can see a letter, ,that is the one that you have to translate in morse, and a rectangle with two buttons on the bottom. You can press in this rectangle to build your morse code: if you just tap the rectangle you'll have a DOT, else if you perform a long press inside the rectangle you'll have a LINE; You also have a clear button to clean your morse sequence.\nWhen you have the sequence, you can press the check button to check the answer: if your answer is correct, you gain one point, if your answer it's not correct you loose one point; in this case you can try with another letter or try again with the same one.\nIn the main page on the top you can also find two buttons:\n\n\t1. A gear , and if you press you can access to the settings.\n\t2. An info symbol, and if you press you can see the entire morse alphabet translated.\n\nPlease note that you can reset your score in the settings.\nI wish you will have a pleasant experience!")
                        .fontDesign(.default)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                }
                .scrollIndicators(.hidden)
                Spacer()
            }
            .padding(.all, 20)
                .navigationTitle("Instructions")
                .navigationBarTitleDisplayMode(.inline)
        }
    }

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
