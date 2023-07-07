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
            .overlay{
                VStack{
                    HStack{
                        Button{
                            // munculin dialog, trus balik ke main map
                        }label: {
                            Image("Map")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: geometry.size.width / 18)
                        
                        Spacer()
                        
                        Button{
                            // kasi hint minigames ini suruh ngapain
                        }label: {
                            Image("Hint")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: geometry.size.width / 18)
                    }
                    .padding(.leading, geometry.size.width / 11)
                    .padding(.trailing, geometry.size.width / 10)
                    .padding(.top, geometry.size.height / 12)
                    
                    Spacer()
                }
            }
            .overlay {
                VStack{
                }
                
                VStack{
                    // Building image
                    Image("Result")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width / 1.35)
//                        .offset(x: geometry.size.height / 2.13)
//                        .offset(y: geometry.size.height / 3.21)
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
