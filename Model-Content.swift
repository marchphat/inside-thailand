//
//  Content.swift
//  InsideThailand
//
//  Created by Nantanat Thongthep on 24/4/2565 BE.
//

import SwiftUI
import SceneKit
import AVFoundation

public struct Content: View {
    
    var models: [Model]
    
    @State var index = 0
    @State var utterance: AVSpeechUtterance!
    @State var synthesizer = AVSpeechSynthesizer()
    @State var speaking = false
    
    public init(models: [Model]) {
        self.models = models
    }
    public var body: some View {
        VStack {
            GeometryReader { geometry in
                SceneView(scene: SCNScene(named: models[index].modelName), options: [.autoenablesDefaultLighting,.allowsCameraControl])
                    .frame(width: geometry.size.width , height: geometry.size.height)
                    .padding(.top, 40)
            }
            
            ZStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            if index > 0 {
                                index -= 1
                            }
                        }
                        
                        if self.synthesizer.isSpeaking {
                            self.synthesizer.stopSpeaking(at: .immediate)
                            self.speaking = false
                        }
                        
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 35, weight: .bold))
                            .opacity(index == 0 ? 0.3 : 1)
                    })
                    .disabled(index == 0 ? true : false)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        withAnimation {
                            if index < models.count {
                                index += 1
                            }
                        }
                        
                        if self.synthesizer.isSpeaking {
                            self.synthesizer.stopSpeaking(at: .immediate)
                            self.speaking = false
                        }
                        
                    }, label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 35, weight: .bold))
                            .opacity(index == models.count - 1 ? 0.3 : 1)
                    })
                    .disabled(index == models.count - 1 ? true : false)
                }
                Text(models[index].name)
                    .font(.system(size: 45, weight: .bold))
            }
            .foregroundColor(.black)
            .padding(.horizontal)
            .padding(.vertical, 28)
            
            VStack(alignment: .leading, spacing: 15, content: {
                
                HStack (spacing: 15) {
                    Text("About")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Button(action: {
                        setTextSpeech(text: models[index].details)

                        if self.synthesizer.isSpeaking {
                            self.synthesizer.stopSpeaking(at: .immediate)
                            self.speaking = false
                        } else {
                            self.synthesizer.speak(utterance)
                            self.speaking = true
                        }
                    }) {
                        Image(systemName: "waveform")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(self.speaking ? .red : .black)
                            .cornerRadius(8)
                            .shadow(radius: 8)
                    }
                }
                
                Text(models[index].details)
            })
            .padding(.horizontal)
            
            Spacer(minLength: 0)
        }
        .edgesIgnoringSafeArea(.top)
        .onDisappear {
            if self.synthesizer.isSpeaking {
                self.synthesizer.stopSpeaking(at: .immediate)
                self.speaking = false
            }
        }
    }
    
    func setTextSpeech(text: String) {
        self.utterance = AVSpeechUtterance(string: text)
        self.utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        self.utterance.rate = 0.5
    }
}
