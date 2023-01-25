//
//  Food.swift
//  InsideThailand
//
//  Created by Nantanat Thongthep on 24/4/2565 BE.
//

import SwiftUI
import SceneKit
import AVFoundation

public struct FoodView: View {
    
    @State var models = [
        
        Model(id: 0, name: "Green Curry", modelName: "Green_Curry.usdz", details: "It’s called Gang Kiew Wan in Thai language, one of the best Thai recipes. The curry is green in color, spicy, aromatic, sweet and savory at the same time. Thai green curry is so delicious, specially when served with steaming white jasmine rice. The green color in this curry comes from the main ingredient in the green curry paste, which is fresh green chilies, hence the name green curry."),
        
        Model(id: 0, name: "Chai Xi", modelName: "Chai_IV.usdz", details: "Chai Xi BameeKiao is the business of selling noodles, noodles and dumplings. The business is a franchise that is widely spread throughout Thailand, in various markets, especially the night market. Almost every male noodle shop will find dumplings that make the phenomenon known to Thai people.")
    ]
    
    public init() {}
    public var body: some View {
        Content(models: models)
    }
    
}

