//
//  Home.swift
//  InsideThailand
//
//  Created by Nantanat Thongthep on 24/4/2565 BE.
//

import SwiftUI
import AVKit
import UIKit
import SceneKit

struct Home: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                Image(uiImage: #imageLiteral(resourceName: "bg_map.jpg"))
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaleEffect(6)
                
                GeometryReader { geometry in
                    VStack () {
                        
                        TextShimmer(text: "Thailand")
                            .frame(width: geometry.size.width, height: geometry.size.height / 6, alignment: .bottom)
                        
                        Pulsate(color: .red, text: "Architecture", view: Architecture())
                            .frame(width: geometry.size.width, height: geometry.size.height / 4, alignment: .bottomLeading)
                            .padding(.leading, 100)

                        Pulsate(color: .blue, text: "Food", view: FoodView())
                            .frame(width: geometry.size.width, height: geometry.size.height / 5, alignment: .topTrailing)
                            .padding(.trailing, 100)

                        Pulsate(color: .yellow, text: "Stuff", view: StuffView())
                            .frame(width: geometry.size.width, height: geometry.size.height / 5, alignment: .leading)
                            .padding(.leading, 250)

                        MusicPlayer(sound: "AppleCinnamon")
                            .frame(width: geometry.size.width, height: geometry.size.height / 8, alignment: .bottomTrailing)
                            .padding(.trailing, 40)
                    }
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height, alignment: .top)
                }
                .ignoresSafeArea()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .overlay(LaunchScreen())
    }
}

public extension Font {
  init(uiFont: UIFont) {
    self = Font(uiFont as CTFont)
  }
}
