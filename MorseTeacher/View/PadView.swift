//
//  PadView.swift
//  MorseTeacher
//
//  Created by Francesco Bernaudo on 12/05/23.
//

import SwiftUI
import AVFoundation
import CoreHaptics

struct PadView: View {
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20.0)
            .frame(width: width, height: height)
            .shadow(color: Color("AccentColor"), radius: 5.0)
    }
    
    
    
}



struct PadView_Previews: PreviewProvider {
    static var previews: some View {
        PadView(height: 100, width: 100)
    }
}
