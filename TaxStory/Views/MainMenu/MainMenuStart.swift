//
//  MainMenuStart.swift
//  TaxStory
//
//  Created by Alex Lim on 23/06/23.
//

import SwiftUI
import AVFoundation

struct MainMenuStart: View {
    @State private var rotationAngle: Angle = .degrees(0)
    @State private var isButtonPressed = false
    @State private var animationCount = 0
    @State var hold = false
    @Binding var page: String
    @State var audioPlayer: AVAudioPlayer?
    
    
    let totalMovements = 2 // Total number of left and right movements
    
    func startGame() {
        // Code to start the game
        withAnimation{
            page = "visualNovel1"
        }
    }
    
    func startMusicIntro() {
        //code to start the music and loop
        guard let path = Bundle.main.path(forResource: "intro", ofType: "mp3") else {
            print("Failed to find the music file")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // Set the number of loops to -1 for infinite looping
            audioPlayer?.play()
        } catch {
            print("Failed to play the music: \(error)")
        }
    }
    
    func calculateButtonOffset() -> CGFloat {
        let totalOffset = Constants.screenWidth * 0.1 // Total offset for left and right movement
        let movementDistance = totalOffset / CGFloat(totalMovements)
        
        let isMovingRight = animationCount % 2 == 0
        
        return isMovingRight ? movementDistance : -movementDistance
    }
    
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
                        .onAppear {
							withAnimation(Animation.linear(duration: 20).repeatForever(autoreverses: false)) {
								rotationAngle = .degrees(360)
							}
                        }
                        .frame(width: Constants.screenWidth * 1, height: Constants.screenWidth * 3)
                }
                .onAppear{
                    startMusicIntro()
                }
                .onDisappear {
                    audioPlayer?.stop()
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
                    Button(action: {
                        startGame()
                        // Start game action
                        withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                            
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
}
    
struct MainMenuStart_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuStart(page: .constant("mainMenu"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
