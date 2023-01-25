//
//  LaunchScreen.swift
//  InsideThailand
//
//  Created by Nantanat Thongthep on 24/4/2565 BE.
//

import SwiftUI

public struct LaunchScreen: View {
    @State var moveOnCirclePath = false
    @State var startAnimation = false
    @State var bowAnimation = false
    @State var airplane = false
    @State var showAirplane = false
    @State var isFinished = false
    
    public init() {}
    public var body: some View {
        HStack {
            if !isFinished {
                ZStack {
                    Color("BG")
                        .ignoresSafeArea()
                    
                    GeometryReader { geometry in
                        let size = geometry.size
                        
                        ZStack {
                            Circle()
                                .trim(from: 0, to: bowAnimation ? 0.5 : 0)
                                .stroke(
                                    .linearGradient(.init(colors: [
                                        Color("GD1"),
                                        Color("GD2"),
                                        Color("GD3"),
                                        Color("GD4"),
                                        Color("GD5").opacity(0.5),
                                        Color("BG"),
                                        Color("BG")

                                    ]), startPoint: .leading, endPoint: .trailing)
                                    , style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)
                                )
                                .overlay(
                                    Image(systemName: "airplane")
                                        .font(.largeTitle)
                                        .frame(width: 45, height: 45)
                                        .foregroundColor(.blue)
                                        .offset(y: -(size.width / 1.95) / 1.95)
                                        .rotationEffect(.degrees(moveOnCirclePath ? 0 : -300))
                                        .opacity(startAnimation ? 1 : 0)
                                )
                                .frame(width: size.width / 1.9, height: size.width / 1.9)
                                .rotationEffect(.init(degrees: -200))
                                .offset(y: 10)
                            
                            HStack (spacing: 2) {
                                Image(uiImage: #imageLiteral(resourceName: "InsideLogo.png"))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: size.width / 1.9, height: size.width / 1.9)
                                    .opacity(bowAnimation ? 1 : 0)
                                
                                Image(uiImage: #imageLiteral(resourceName: "thailand_flag.png"))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: size.width / 10, height: size.width / 10, alignment: .bottom)
                                    .scaleEffect(showAirplane ? 1 : 0)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.linear(duration: 2)) {
                                    bowAnimation.toggle()
                                }
                                
                                DispatchQueue.main.async {
                                    withAnimation(.linear(duration: 2).speed(0.74)) {
                                        moveOnCirclePath.toggle()
                                    }
                                }

                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.spring()) {
                                        startAnimation.toggle()
                                    }
                                }

                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    withAnimation(.spring()) {
                                        showAirplane.toggle()
                                        startAnimation.toggle()
                                    }
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.7) {
                                    withAnimation {
                                        isFinished.toggle()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


