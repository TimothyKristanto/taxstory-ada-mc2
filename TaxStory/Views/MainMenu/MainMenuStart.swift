//
//  MainMenuStart.swift
//  TaxStory
//
//  Created by Alex Lim on 23/06/23.
//

import SwiftUI

struct MainMenuStart: View {
    var body: some View {
        ZStack {
            // Background image
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            // SunShine
            Image("shine")
                .resizable()
                .scaledToFit()
            
            // Building image
            Image("building")
                .resizable()
                .scaledToFit()
            
            // Tittle
            Image("tittle")
                .resizable()
                .scaledToFit()

            
//            VStack {
//                Text("Menu")
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//                    .padding()
//
//                Button(action: {
//                    // Start game action
//                    startGame()
//                }) {
//                    Text("Start Game")
//                        .font(.title)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//            }
        }
    }
    
    func startGame() {
        // Code to start the game
        print("Starting the game...")
    }
}


struct MainMenuStart_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuStart()
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
