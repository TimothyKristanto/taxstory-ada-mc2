//
//  ChoosePTKPView.swift
//  TaxStory
//
//  Created by Timothy on 03/07/23.
//

import SwiftUI
import SpriteKit

struct ChoosePTKPView: View {
    @State var isStarted = false
    @State var isCorrect = false
    @State var isWrong = false
    @State var wrongText = ""
	@State var showMapModal = false
	
	@Binding var page: Bool
    
    var scene: SKScene {
        let scene = PTKPMazeScene(wrong: $isWrong, correct: $isCorrect, text: $wrongText)
        scene.size = CGSize(width: Constants.screenWidth, height: Constants.screenHeight)
        
        return scene
    }
    
    var body: some View {
        GeometryReader{ geoScreen in
            Image("bg")
                .resizable()
                .frame(width: geoScreen.size.width, height: geoScreen.size.height)
                .scaledToFill()
                .overlay{
                    VStack{
                        HStack{
                            Button{
                                // munculin dialog, trus balik ke main map
								showMapModal = true
                            }label: {
                                Image("Map")
                                    .resizable()
                                    .scaledToFit()
                            }
							.fullScreenCover(isPresented: $showMapModal) {
								WarningMapModal(showMapModal: $showMapModal, page: $page)
							}
                            .frame(width: geoScreen.size.width / 18)
                            
                            Spacer()
                            
                            Button{
                                // kasi hint minigames ini suruh ngapain
                            }label: {
                                Image("Glosarium")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .frame(width: geoScreen.size.width / 18)
                            
                            Button{
                                // kasi hint minigames ini suruh ngapain
                            }label: {
                                Image("Hint")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .frame(width: geoScreen.size.width / 18)
                        }
                        .padding(.leading, geoScreen.size.width / 11)
                        .padding(.trailing, geoScreen.size.width / 10)
                        .padding(.top, geoScreen.size.height / 12)
                        
                        Spacer()
                    }
                }
                .overlay{
                    GeometryReader{ geoTop in
                        VStack{
                            VStack{
                                Image("Quest")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geoTop.size.width / 5.8)
                            }
                            .overlay(
                                VStack{
                                    Text("Quest")
                                        .font(.system(size: geoTop.size.width / 60, design: .rounded))
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding(.top, geoTop.size.height / 130)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading){
                                        HStack{
                                            Image(systemName: "checkmark.circle.fill")
												.foregroundColor(Color("Dark Brown"))
                                            
                                            Text("Pilih form")
                                                .font(.system(size: geoTop.size.width / 55, design: .rounded))
												.foregroundColor(Color("Dark Brown"))
                                        }
                                        
                                        HStack{
                                            Image(systemName: "checkmark.circle.fill")
												.foregroundColor(Color("Dark Brown"))
                                            
                                            Text("Minta bukti potong")
                                                .font(.system(size: geoTop.size.width / 55, design: .rounded))
												.foregroundColor(Color("Dark Brown"))
                                        }
                                        
                                        HStack{
                                            Image(systemName: "checkmark.circle.fill")
												.foregroundColor(Color("Dark Brown"))
                                            
                                            Text("Isi formulir")
                                                .font(.system(size: geoTop.size.width / 55, design: .rounded))
												.foregroundColor(Color("Dark Brown"))
                                        }
                                        
                                        HStack {
                                            Image(systemName: "checkmark.circle.fill")
												.foregroundColor(Color("Dark Brown"))
											
                                            Text("Lapor Harta")
                                                .font(.title2)
												.foregroundColor(Color("Dark Brown"))
                                        }
                                        
                                        HStack{
                                            Image(systemName: "circle.fill")
												.foregroundColor(Color("Dark Brown"))
                                            
                                            Text("PTKP")
                                                .font(.system(size: geoTop.size.width / 55, design: .rounded))
												.foregroundColor(Color("Dark Brown"))
                                        }
                                        
                                        HStack{
                                            Image(systemName: "circle")
												.foregroundColor(Color("Dark Brown"))
                                            
                                            Text("Result")
                                                .font(.system(size: geoTop.size.width / 55, design: .rounded))
												.foregroundColor(Color("Dark Brown"))
                                        }
                                    }
                                    .padding(.horizontal, geoTop.size.width / 30)
                                    .padding(.top, geoTop.size.height / 50)
                                    
                                    Spacer()
                                }
                            )
                            .offset(y: geoTop.size.height / 5.5)
                            .offset(x: geoTop.size.width / 12)
                            
                            Spacer()
                        }
                    }
                }
                .overlay {
                    GeometryReader { geoBot in
                        VStack{
                            Spacer()
                                
                            HStack{
                                Image("bayu-pilih-form")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geoBot.size.width / 8)
                                    .offset(x: geoBot.size.width / 10, y: -geoBot.size.height / 9)
                                
                                Image("text-guide-pilih-form")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geoBot.size.width, height: geoBot.size.height / 6)
                                    .overlay{
                                        Text("Setelah melaporkan harta, Bayu harus memilih tipe PTKP (Penghasilan Tidak Kena Pajak) yang sesuai kondisinya. Saat ini, Bayu belum menikah sehingga tidak punya anak serta tidak punya keluarga. Bayu juga belum memiliki tanggungan yang lain.")
                                            .font(.system(size: geoBot.size.width / 63, design: .rounded))
                                            .foregroundColor(Color("Dark Brown"))
                                            .bold()
                                            .padding(.leading, geoBot.size.width / 4.5)
                                            .padding(.trailing, geoBot.size.width / 5)
                                            .offset(y: -geoBot.size.height / 95)
                                    }
                                    .offset(x: -geoBot.size.width / 14, y: -geoBot.size.height / 14)
                            }
                        }
                    }
                }
                .overlay {
                    if isStarted {
                        if isWrong == false {
                            SpriteView(scene: scene, options: [.allowsTransparency])
                                .frame(width: geoScreen.size.width / 2.009, height: geoScreen.size.height / 2.009)
                                .overlay {
                                    GeometryReader { geoMaze in
                                        Image("tk0")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geoMaze.size.width / 6.5, height: geoMaze.size.height / 6.5)
                                            .offset(x: -geoMaze.size.width / 12, y: geoMaze.size.height / 4.9)
                                    }
                                }
                                .overlay {
                                    GeometryReader { geoMaze in
                                        Image("tk1")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geoMaze.size.width / 6.5, height: geoMaze.size.height / 6.5)
                                            .offset(x: -geoMaze.size.width / 12, y: geoMaze.size.height / 2.18)
                                    }
                                }
                                .overlay {
                                    GeometryReader { geoMaze in
                                        Image("k0")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geoMaze.size.width / 6.5, height: geoMaze.size.height / 6.5)
                                            .offset(x: geoMaze.size.width / 4.9, y: geoMaze.size.height / 1.02)
                                    }
                                }
                                .overlay {
                                    Image("bayuMaze")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geoScreen.size.width / 7, height: geoScreen.size.height / 7)
                                        .offset(x: geoScreen.size.width / 3.7, y: -geoScreen.size.height / 6)
                                }
                                .offset(x: geoScreen.size.width / 15, y: -geoScreen.size.height / 11)
                        }
                    } else {
                        Image("mazeStartMenu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geoScreen.size.width / 1.8)
                            .blur(radius: 5)
                            .overlay {
                                GeometryReader { geoMazeCover in
                                    Button {
                                        withAnimation{
                                            isStarted = true
                                        }
                                    }label: {
                                        Image("playMaze")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geoMazeCover.size.width / 1.8)
                                    }
                                    .offset(x: geoMazeCover.size.width / 4.3, y: geoMazeCover.size.height / 2.9)
                                }
                                    
                            }
                            .offset(x: geoScreen.size.width / 15, y: -geoScreen.size.height / 13)
                    }
                }
                .fullScreenCover(isPresented: $isWrong) {
                    WarningPTKPView(isWrong: $isWrong, wrongText: $wrongText)
                }
                
        }
        .ignoresSafeArea()
    }
}

struct ChoosePTKPView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePTKPView(page: $page)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
