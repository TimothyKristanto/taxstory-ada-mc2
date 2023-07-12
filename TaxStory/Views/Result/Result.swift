//
//  Result.swift
//  TaxStory
//
//  Created by Alex Lim on 07/07/23.
//

import SwiftUI

struct Result: View {
    var body: some View {
        GeometryReader
        { geometry in
        // Background image
        Image("bg")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .overlay {
                VStack{
                }
                
                VStack{
                    // Building image
                    Image("Result")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width / 1.55)
//                        .offset(x: geometry.size.height / 2.13)
                        .offset(y: -geometry.size.height / 12.21)
                }
            }
                
//                VStack{
//                    // Tittle
//                    Image("tittle")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: Constants.screenWidth * 1, height: Constants.screenWidth * 0.37)
//                        .padding(.bottom, Constants.screenHeight * 0.25)
//                }

                    }
                
            }
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
