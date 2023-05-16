//
//  QuizView.swift
//  MorseTeacher
//
//  Created by Francesco Bernaudo on 11/05/23.
//

import SwiftUI
import AVFoundation
import CoreHaptics

struct QuizView: View {
    @EnvironmentObject var score: ScoreVM
    @State private var letter: String = ""
    @State var engine: CHHapticEngine?
    @State var morse: String = ""
    @State var testletter: String = "A"
    @State var isShowingAlert: Bool = false
    @State var isCorrect: Bool = false
    @State var audioplayer: AVAudioPlayer?
    var dot = LongPressGesture(minimumDuration: 0.01, maximumDistance: 100)
    var line = LongPressGesture(minimumDuration: 0.30, maximumDistance: 100)
    let morseAlphabet = MorseAlphabet()
    var body: some View {
        NavigationStack{
            GeometryReader{ geometry in
            VStack(spacing: 50){
                SymbolView(letter: testletter) //serve variabile
                Text("Score: \(score.score)")
                    .font(.title.bold())
                VStack(spacing: 20){
                    PadView(height: geometry.size.height * 0.25, width: geometry.size.width * 0.75)
                        .gesture(line.onEnded({_ in
                            DispatchQueue.main.async {
                                guard let url = Bundle.main.url(forResource: "line", withExtension: "mp3") else {print("no resources found")
                                    return
                                }
                                do{
                                    audioplayer =  try AVAudioPlayer(contentsOf: url)
                                } catch {
                                    print("error in creating audioplayer")
                                }
                                audioplayer?.prepareToPlay()
                                audioplayer?.play()
                                prepareHaptics()
                                complexSuccess(isLine: false)
                            }
                            morse.append("-")
                            print(morse)
                            
                        })
                            .exclusively(before: dot.onEnded({_ in
                                DispatchQueue.main.async {
                                    guard let url = Bundle.main.url(forResource: "dot", withExtension: "mp3") else {print("no resources found")
                                        return
                                    }
                                    do{
                                        audioplayer =  try AVAudioPlayer(contentsOf: url)
                                    } catch {
                                        print("error in creating audioplayer")
                                    }
                                    audioplayer?.prepareToPlay()
                                    audioplayer?.play()
                                    prepareHaptics()
                                    complexSuccess(isLine: true)
                                }
                                morse.append(".")
                                print(morse)
                            })))
                    HStack{
                        //Button Check
                        Button(action: {
                            letter = morseAlphabet.findLetter(morseSign: morse)
                            isCorrect = morseAlphabet.checkLetter(letter: letter, testLetter: testletter)
                            isShowingAlert = true
                            print(isCorrect) // debug
                        }, label: {ButtonView(name: "Check")})
                        Spacer()
                        //Button Clear
                        Button(action: {morse = ""}, label: {ButtonView(name: "Clear")})
                    }
                    .padding(.horizontal, 50)

                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
            .navigationTitle("MorseTeach")
            .toolbar {
                NavigationLink(destination: SettingsView(), label: {Image(systemName: "gear")})
                NavigationLink(destination: TutorialView(), label: {Image(systemName: "info")})
            }
            .alert(isPresented: $isShowingAlert) {
                isCorrect ?
                Alert(title: Text("Result"), message: Text("CORRECT! Your score is  \(score.score + 1)."), dismissButton: .default(Text("Next"), action: {testletter = morseAlphabet.randomLetter()
                    morse = ""
                    score.score = score.score + 1
                }))
                :
                Alert(title: Text("Result"), message: Text("Oops! It is NOT Correct. Your score is \(score.score - 1)"), primaryButton: .default(Text("Next"), action: {testletter = morseAlphabet.randomLetter()
                    morse = ""
                    score.score = score.score - 1
                }),
                      secondaryButton: .default(Text("Try again!"), action: {morse = ""
                    score.score = score.score - 1
                })
                )}
        }
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess(isLine: Bool) {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        // create one intense, sharp tap
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 10)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 5)
        let hapticEvent = CHHapticEvent(eventType: isLine ? .hapticTransient : .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: 0.35)
        events.append(hapticEvent)

        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(ScoreVM())
    }
}
