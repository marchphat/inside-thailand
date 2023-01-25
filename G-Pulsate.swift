//
//  Pulsate.swift
//  InsideThailand
//
//  Created by Nantanat Thongthep on 24/4/2565 BE.
//

import SwiftUI

public struct Pulsate<Content : View>: View {
    
    @State var wave = false
    @State var wave2 = false
    @State var degress: CGFloat = 0
    
    let color: Color
    let text: String
    let view: Content
    
    public init(color: Color, text: String, view: Content) {
        self.color = color
        self.text = text
        self.view = view
    }
    
    public var body: some View {
        ZStack {

            Circle()
                .stroke(lineWidth: 40)
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .scaleEffect(wave ? 2 : 1)
                .opacity(wave ? 0 : 1)
                .onAppear() {
                    DispatchQueue.main.async {
                        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false).speed(0.5)) {
                            wave.toggle()
                            wave = true
                        }
                    }
                }
            
            Circle()
                .stroke(lineWidth: 40)
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .scaleEffect(wave2 ? 2 : 1)
                .opacity(wave2 ? 0 : 1)
                .onAppear() {
                    DispatchQueue.main.async {
                        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false).speed(0.5)) {
                            wave2.toggle()
                            wave2 = true
                        }
                    }
                }

            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .shadow(radius: 25)

            NavigationLink(destination: view, label: {
                Text(text)
                    .foregroundColor(.white)
            })
            
        }
    }
}

