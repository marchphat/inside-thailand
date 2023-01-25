//
//  TextShimmer.swift
//  InsideThailand
//
//  Created by Nantanat Thongthep on 24/4/2565 BE.
//

import SwiftUI
import UIKit

public struct TextShimmer: View {
    func font() -> UIFont {
            let fontURL = Bundle.main.url(forResource: "28 Days Later", withExtension: "ttf")
            CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
            let font = UIFont(name: "28 Days Later", size: 50)!
            return font
    }
    
    var text: String
    @State var animation = false
    
    public init(text: String) {
        self.text = text
    }
    public var body: some View {
        ZStack {
            Text(self.text)
                .font(Font(font()))
                .foregroundColor(.white.opacity(0.8))
                .frame(width: 230, height: 70)
                .background(Image(uiImage: #imageLiteral(resourceName: "bg_topic.png")).resizable())
        
            HStack (spacing: 0) {
                ForEach(0..<text.count, id: \.self) { index in
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.custom("28 Days Later", size: 50))
                        .foregroundColor(Color.white)
                }
            }
            .mask(
                Rectangle()
                    .fill(
                        LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5), Color.white, Color.white.opacity(5.0)]), startPoint: .top, endPoint: .bottom)
                    )
                    .rotationEffect(.init(degrees: 70))
                    .padding(20)
                    .offset(x: -250)
                    .offset(x: self.animation ? 500 : 0)
            )
            
            .onAppear() {
                DispatchQueue.main.async {
                    withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                        self.animation.toggle()
                        self.animation = true
                    }
                }
            }
        }
    }
}

