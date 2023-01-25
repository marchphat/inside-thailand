//
//  Stuff.swift
//  InsideThailand
//
//  Created by Nantanat Thongthep on 24/4/2565 BE.
//

import SwiftUI

public struct StuffView: View {
    @State var models = [
        Model(id: 0, name: "Perfume", modelName: "Thai_Perfume.usdz", details: "Thai Perfume or 'Nam Ob Thai' has been around with Thai people for a long time. Use in many occasions especially Thai New Year ( Song Kran ), mix in a jar of water and sprinkle over the Buddha. Thai perfume or nam ob thai can be parted of offering to the monk as well as a gift to someone you respected. Product of Thailand."),
        
        Model(id: 0, name: "Cigarette Pack", modelName: "Cigarette_Pack.usdz", details: "If you buy cigarettes in Thailand, you will see cigarette packs that look like this all over the place. In case you don't know but Thailand is the first country in Asia and eleventh in the world to introduce plain cigarette packaging to reduce the appeal of smoking. In Thailand, the health impact is huge and smoking-related illnesses are a leading cause of death.")
    ]
    
    public init() {}
    public var body: some View {
        Content(models: models)
    }
}

