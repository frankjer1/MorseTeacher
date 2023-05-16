//
//  SymbolView.swift
//  MorseTeacher
//
//  Created by Francesco Bernaudo on 11/05/23.
//

import SwiftUI

struct SymbolView: View {
    var letter: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20.0)
                .frame(width: 200, height: 200)
            Text(letter)
                .font(.custom("letter", size: 100))
                .fontWeight(.light)
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
        }
    }
}

struct SymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView(letter: "A")
    }
}
