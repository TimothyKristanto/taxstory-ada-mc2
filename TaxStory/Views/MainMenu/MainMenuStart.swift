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
    let totalMovements = 2 // Total number of left and right movements
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
                        .padding(.bottom, Constants.screenHeight * 0.25)
                }
                
                VStack {
                    Button(action: {4
                        // Start game action
                        withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                            startGame()
                            isButtonPressed = true // Set isButtonPressed to true when the button is pressed
                        }
                    }) {
                        Image("StartButton")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .rotationEffect(.degrees(isButtonPressed ? 5 : -5)) // Apply rotation effect based on button press
                    }
                    .frame(width: Constants.screenWidth * 0.4, height: Constants.screenWidth * 0.9)
                    .padding(.top, Constants.screenHeight * 0.5)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                            isButtonPressed = true // Set isButtonPressed to true to start the initial animation
                        }
                    }
                }

                    }
                
            }
    func calculateButtonOffset() -> CGFloat {
        let totalOffset = Constants.screenWidth * 0.1 // Total offset for left and right movement
        let movementDistance = totalOffset / CGFloat(totalMovements)
        
        let isMovingRight = animationCount % 2 == 0
        
        return isMovingRight ? movementDistance : -movementDistance
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
