//
//  MainMenuStart.swift
//  TaxStory
//
//  Created by Alex Lim on 23/06/23.
//

import SwiftUI

struct MainMenuStart: View {
    @State private var rotationAngle: Angle = .degrees(0)
    @State private var isButtonPressed = false
    @State private var animationCount = 0
    @State var hold = false
    var body: some View {
        // Background image
        Image("background")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .overlay {
                VStack{
                    // SunShine
                    Image("shine")
                        .resizable()
                        .scaledToFill()
                        .rotationEffect(rotationAngle)
                        .onAppear {withAnimation(Animation.linear(duration: 20).repeatForever(autoreverses: false)) {rotationAngle = .degrees(360)
                        }
                        }
                        .frame(width: Constants.screenWidth * 1, height: Constants.screenWidth * 3)
                }
                
                VStack{
                    // Building image
                    Image("building")
                        .resizable()
                        .scaledToFit()
                }
                
                VStack{
                    // Tittle
                    Image("tittle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: Constants.screenWidth * 1, height: Constants.screenWidth * 0.37)
                        .padding(.bottom, Constants.screenHeight * 0.45)
                }
                
                VStack {
                            Button(action: {
                                // Start game action
                                withAnimation(.interpolatingSpring(stiffness: 300, damping: 10)) {
                                    startGame()
                                    isButtonPressed = true // Set isButtonPressed to true when the button is pressed
                                }
                                
                                // Reset isButtonPressed after a delay
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation {
                                        isButtonPressed = false
                                    }
                                }
                            }) {
                                Image("StartButton")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: Constants.screenWidth * 0.4, height: Constants.screenWidth * 0.37)
                                    .padding(.top, Constants.screenHeight * 0.5)
                                    .scaleEffect(isButtonPressed ? 0.9 : 1.0) // Apply scale effect based on button press
                            }
                            .animation(.spring()) // Apply animation to the button press
                        }            }
        }
    }
        
    
    
    
    
    func startGame() {
        // Code to start the game
        print("Starting the game...")
    }
    
    

    struct MainMenuStart_Previews: PreviewProvider {
        static var previews: some View {
            MainMenuStart()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
