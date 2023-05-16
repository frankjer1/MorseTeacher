//
//  ButtonView.swift
//  MorseTeacher
//
//  Created by Francesco Bernaudo on 11/05/23.
//

import SwiftUI

struct ButtonView: View {
    var name: String = "check"
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 400)
                .frame(width: 100, height: 25)
                .foregroundColor(.accentColor)
                .shadow(radius: 5.0)
            Text(name)
                .font(.title3)
                .fontWeight(.semibold)
                .fontDesign(.default)
                .foregroundColor(Color("TextColor"))
        }

    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
