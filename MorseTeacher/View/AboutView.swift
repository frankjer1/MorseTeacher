//
//  AboutView.swift
//  MorseTeacher
//
//  Created by Francesco Bernaudo on 11/05/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        Text("Developed by Francesco Bernaudo.\nAll the sounds are self - produced")
            .fontDesign(.monospaced)
            .font(.callout)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
