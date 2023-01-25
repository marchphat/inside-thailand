//
//  SwiftUIView.swift
//  InsideThailand
//
//  Created by Nantanat Thongthep on 24/4/2565 BE.
//

import SwiftUI
import SceneKit

public struct Architecture: View {
    @State var models = [
        
        Model(id: 0, name: "Wat Mahathat", modelName: "Wat_Mahathat.usdz", details: "Wat Mahathat, “the temple of the Great Relic” was one of the most important temples in the Ayutthaya Kingdom. Located on the historical island the large monastery features a huge central prang, a very large principal viharn and ubosot and a great number of subsidiary chedis and viharns."),
        
        Model(id: 0, name: "Grocery", modelName: "Shops_Thai.usdz", details: "It’s called Cho Huay in Thai language. Shops like this were commonly seen in the past, but today there are still some. This charming shop houses sell vintage items and tasty local food and selling inexpensive. If you want to see a lot of shops like this I recommend going to Klong Suan100."),
    ]
    
    public init() {}
    public var body: some View {
        Content(models: models)
    }
}
