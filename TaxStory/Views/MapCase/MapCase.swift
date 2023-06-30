//
//  MapCase.swift
//  TaxStory
//
//  Created by Alex Lim on 29/06/23.
//

import SwiftUI

struct MapCase: View {
//    @State private var isButtonPressed = false
    @State private var isAnimating = false
    @State private var rotationAngle: Angle = .degrees(0)
    @State private var isButtonPressed = false
    @State private var animationCount = 0
    @State var hold = false
    @Binding var page: String
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                Image("map")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay{
                        VStack{
                            // Building image
                            Button(action: {
                                // Start game action
                                withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
//                                    startGame()
                                    isButtonPressed = true // Set isButtonPressed to true when the button is pressed
                                }
                            }) {Image("point1")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .rotationEffect(.degrees(isButtonPressed ? 10 : -10))
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/10)
                                    
                            }
                            .offset(y: -geometry.size.height / 3.5)
                            .offset(x: -geometry.size.height / 3)
                        }
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                                isButtonPressed = true // Set isButtonPressed to true to start the initial animation
                            }
                        }
                        
                        VStack{
                            // Building image
                            Button(action: {
                                // Start game action
                                withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
//                                    startGame()
                                    isButtonPressed = true // Set isButtonPressed to true when the button is pressed
                                }
                            }) {Image("point2")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .rotationEffect(.degrees(isButtonPressed ? -10 : 10))
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/10)
                                    
                            }
                            .offset(y: -geometry.size.height / 12.5)
                            .offset(x: -geometry.size.height / 5)
                        }
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                                isButtonPressed = true // Set isButtonPressed to true to start the initial animation
                            }
                        }
                        
                        VStack{
                            // Building image
                            Button(action: {
                                withAnimation{
                                    page = "case3"
                                }
                                
                                // Start game action
                                withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
//                                    startGame()
                                    isButtonPressed = true // Set isButtonPressed to true when the button is pressed
                                }
                            }) {Image("point3")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .rotationEffect(.degrees(isButtonPressed ? 10 : -10))
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/10)
                                    
                            }
                            .offset(y: -geometry.size.height / 8.5)
                            .offset(x: geometry.size.height / 15)
                        }
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                                isButtonPressed = true // Set isButtonPressed to true to start the initial animation
                            }
                        }
                        
                        VStack{
                            // Building image
                            Button(action: {
                                // Start game action
                                withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
//                                    startGame()
                                    isButtonPressed = true // Set isButtonPressed to true when the button is pressed
                                }
                            }) {Image("point4")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .rotationEffect(.degrees(isButtonPressed ? -10 : 10))
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/10)
                                    
                            }
                            .offset(y: geometry.size.height / 60.5)
                            .offset(x: geometry.size.height / 3.4)
                        }
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                                isButtonPressed = true // Set isButtonPressed to true to start the initial animation
                            }
                        }

                        
                    }
                VStack {
                    // guide text
                    Spacer()
                    HStack {
                        Image("bayu-pilih-form")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width / 5)
                            .offset(y: -geometry.size.height / 45.85)
                            .offset(x: geometry.size.height / 25.55)
                        Image("textbox")
                            .resizable()
                            .scaledToFit()
                            .padding(.top, geometry.size.height / 7)
                            .offset(y: -geometry.size.height / 1000.85)
                            .offset(x: geometry.size.height / 200.55)
                            .frame(width: geometry.size.width / 1.4)
                            .overlay(
                                Text("Nanti je dah atur belum tak atur ")
                                    .font(.title2)
                                    .bold()
                                    .offset(y: geometry.size.height / 20.85)
                                    .offset(x: geometry.size.height / 200.55)
                            )
                    }
                }
                .padding(.bottom, geometry.size.height / 72.2)
                .padding(.trailing, geometry.size.width / 1)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                
            }
        }
    }
}

struct MapCase_Previews: PreviewProvider {
    static var previews: some View {
        MapCase(page: .constant("mapCase"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
