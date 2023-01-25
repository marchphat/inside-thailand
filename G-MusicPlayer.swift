//
//  MusicPlayer.swift
//  InsideThailand
//
//  Created by Nantanat Thongthep on 24/4/2565 BE.
//

import Foundation
import AVKit
import SwiftUI

public struct MusicPlayer : View {

    @State var player: AVAudioPlayer!
    @State var playing = false
    var sound: String
    
    public init(sound: String) {
        self.sound = sound
    }
    public var body : some View {
        Button(action: {
            if self.player.isPlaying {
                self.player.stop()
                self.playing = false
            } else {
                self.player.play()
                self.playing = true
            }
        }) {
            Image(systemName: self.playing ? "speaker.wave.2.fill" : "speaker.slash")
                .foregroundColor(.white)
                .padding(8)
                .background(.black)
                .cornerRadius(8)
                .shadow(radius: 10)
        }
        .onAppear {
            if let path = Bundle.main.path(forResource: self.sound, ofType: "mp3") {
                do {
                    self.player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    self.player.prepareToPlay()
                } catch {
                    print("Error: Could not find and play the sound file!")
                }
            }
        }
    }
}
