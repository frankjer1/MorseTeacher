//
//  MorseAlphabet.swift
//  MorseTeacher
//
//  Created by Francesco Bernaudo on 11/05/23.
//

import Foundation

struct MorseAlphabet {
    
    let alphabet: [String:String] = [".-":"A","-...":"B","-.-.":"C","-..":"D",".":"E","..-.":"F","--.":"G","....":"H","..":"I",".---":"J","-.-":"K",".-..":"L","--":"M","-.":"N","---":"O",".--.":"P","--.-":"Q",".-.":"R","...":"S","-":"T","..-":"U","...-":"V",".--":"W","-..-":"X","-.--":"Y","--..":"Z", "-----":"0", ".----":"1", "..---":"2", "...--":"3", "....-":"4", ".....":"5", "-....":"6", "--...":"7", "---..":"8", "----.":"9"]
    
    func findLetter(morseSign: String)->String {
        var letter: String?
        for key in alphabet.keys {
            if morseSign == key {
                letter = alphabet[key]
            }
        }
        return letter ?? "No matches found."
    }
    
    func checkLetter(letter: String, testLetter: String)->Bool {
        var result = false
        if letter == testLetter{
            result.toggle()
        }
        return result
    }
    
    func randomLetter()->String {
        return alphabet.values.randomElement() ?? "Err."
    }
}
