//
//  CobaPakSupir.swift
//  TaxStory
//
//  Created by Alex Lim on 11/07/23.
//

import SwiftUI

struct VisualNovel: View {
    @State private var tapCount = 1
    
    var body: some View {
        GeometryReader { geoScreen in
            VStack {
//                Text("Tap Count: \(tapCount)")
//                    .foregroundColor(.white)
//                    .font(.title)
                
                ForEach((1...18), id: \.self) { index in
                    Image("previewNovel\(tapCount)")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .overlay(
                            //actionya sini ya timmy tinggal sikat jangan sampe NT actionya
                            Button(action: {})
                            {
                                Text("")
                                    .frame(width: 100, height: 80)
                                    .foregroundColor(Color.white)
//                                    .background(Color.black)
                                    .clipShape(Circle())

                            }
                            .offset(x: -geoScreen.size.height / 1.653)
                            .offset(y: -geoScreen.size.height / 2.141))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .onTapGesture {
                tapCount += 1
                if tapCount == 18 {
                    tapCount = 0
                }
                // Call your function or perform any other action here
            }
        }
    }
}

struct VisualNovel_Previews: PreviewProvider {
    static var previews: some View {
        VisualNovel()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
