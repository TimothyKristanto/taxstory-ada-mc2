//
//  RequestWitholdingTaxCertificateView.swift
//  TaxStory
//
//  Created by Timothy on 25/06/23.
//

import SwiftUI
import AVFoundation

struct RequestWitholdingTaxCertificateView: View {
    @State var jump = false
    @State var cloudIsMoving = false
    @State var shadowIsShining = false
    @State var isCorrect = false
    
    @State var audioPlayer: AVAudioPlayer?
    
    @State var carX: CGFloat = 0
    @State var carY: CGFloat = 0
    
	@State var showMapModal = false
	@State var showHint = false
	@State var showGlosarium = false
	
    @Binding var page: String
    
    func startMusicChallenge() {
        //code to start the music and loop
        guard let path = Bundle.main.path(forResource: "challenge", ofType: "mp3") else {
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

    
    var body: some View {
        GeometryReader{ geoScreen in
            Image("bg")
                .resizable()
				.frame(width: Constants.screenWidth, height: Constants.screenHeight)
                .scaledToFill()
                .overlay (
                    GeometryReader{ geo in
                        VStack{
                            ZStack{
                                Image("mapMintaBuktiPotong")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width / 1.15)
                                    .overlay(
                                        Image("awan")
                                            .resizable()
                                            .scaledToFit()
                                            .offset(x: cloudIsMoving ? geo.size.width / 25 : geo.size.width / 40)
                                            .offset(y: cloudIsMoving ? -geo.size.height / 5 : -geo.size.height / 5)
                                    )
                                    .overlay(
                                        HStack{
                                            VStack{
                                                Image("Quest")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 5.8)
                                                    .overlay(
                                                        GeometryReader{ geoQuest in
                                                            VStack{
                                                                Text("Quest")
                                                                    .font(.system(size: geoQuest.size.width / 10, design: .rounded))
                                                                    .bold()
                                                                    .foregroundColor(.white)
                                                                    .offset(x: geoQuest.size.width / 10, y: geoQuest.size.height / 55)
                                                                
                                                                Spacer()
                                                                
                                                                VStack(alignment: .leading){
                                                                    HStack{
                                                                        Image(systemName: "checkmark.circle.fill")
																			.foregroundColor(Color("Dark Brown"))
                                                                        
                                                                        Text("Pilih form")
                                                                            .font(.system(size: geoQuest.size.width / 10, design: .rounded))
																			.foregroundColor(Color("Dark Brown"))
                                                                    }
                                                                    
                                                                    HStack{
                                                                        Image(systemName: "circle.fill")
																			.foregroundColor(Color("Dark Brown"))
                                                                        
                                                                        Text("Minta bukti potong")
                                                                            .font(.system(size: geoQuest.size.width / 10, design: .rounded))
																			.foregroundColor(Color("Dark Brown"))
                                                                    }
                                                                    
                                                                    HStack{
                                                                        Image(systemName: "circle")
																			.foregroundColor(Color("Dark Brown"))
                                                                        
                                                                        Text("Isi formulir")
                                                                            .font(.system(size: geoQuest.size.width / 10, design: .rounded))
																			.foregroundColor(Color("Dark Brown"))
                                                                    }
                                                                    
                                                                    HStack {
                                                                        Image(systemName: "circle")
																			.foregroundColor(Color("Dark Brown"))
																		
                                                                        Text("Lapor Harta")
                                                                            .font(.title2)
																			.foregroundColor(Color("Dark Brown"))
                                                                    }
                                                                    
                                                                    HStack{
                                                                        Image(systemName: "circle")
																			.foregroundColor(Color("Dark Brown"))
                                                                        
                                                                        Text("PTKP")
                                                                            .font(.system(size: geoQuest.size.width / 10, design: .rounded))
																			.foregroundColor(Color("Dark Brown"))
                                                                    }
                                                                    
                                                                    HStack{
                                                                        Image(systemName: "circle")
																			.foregroundColor(Color("Dark Brown"))
                                                                        
                                                                        Text("Result")
                                                                            .font(.system(size: geoQuest.size.width / 10, design: .rounded))
																			.foregroundColor(Color("Dark Brown"))
                                                                    }
                                                                }
                                                                .padding(.leading, geoQuest.size.width / 5)
                                                                .padding(.top, geoQuest.size.height / 10)
                                                                
                                                                Spacer()
                                                            }
                                                        }
                                                    )
                                                    .offset(y: geo.size.width / 20)
                                                
                                                Spacer()
                                            }
                                            
                                            Spacer()
                                            
                                            VStack{
                                                Spacer()
                                                
                                                HStack{
                                                    Image("text-minta-bukti-potong")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: geo.size.width / 3, height: geo.size.height / 5)
                                                        .overlay(
                                                            GeometryReader{ geoTextGuide in
                                                                Text("Yuk bantuin Bayu untuk menemukan jalan yang benar menuju kantor perusahaan tempat Bayu bekerja supaya Bayu bisa meminta bukti potong.")
                                                                    .font(.system(size: geoTextGuide.size.width / 25, design: .rounded))
                                                                    .foregroundColor(Color("Dark Brown"))
                                                                    .bold()
                                                                    .offset(x: -geoTextGuide.size.width / 20, y: geoTextGuide.size.height / 4)
                                                                    .padding(.horizontal, geoTextGuide.size.width / 15)
                                                            }
                                                        )
                                                        .offset(y: -geo.size.height / 15)
                                                    
                                                    Image("bayu-minta-bukti-potong")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: geo.size.width / 5, height: geo.size.height / 4.5)
                                                        .offset(x: -geo.size.width / 40)
                                                        .offset(y: -geo.size.height / 13)
                                                }
                                            }
                                        }
                                    )
                                    .overlay{
										Image("bensin")
											.resizable()
											.scaledToFit()
											.frame(width: geo.size.width / 15)
											.offset(x: geo.size.width / 80, y: geo.size.height / 20)
                                        }
                                    .overlay{
										Image("Cafe")
											.resizable()
											.scaledToFit()
											.frame(width: geo.size.width / 18)
											.offset(x: geo.size.width / 7.5, y: -geo.size.height / 22)

                                        }
                                    .overlay{
										Image("Hospital")
											.resizable()
											.scaledToFit()
											.frame(width: geo.size.width / 7.5)
											.offset(x: geo.size.width / 10.6, y: -geo.size.height / 5.98)
                                    }
                                    .overlay{
										Image("kantor-polisi")
											.resizable()
											.scaledToFit()
											.frame(width: geo.size.width / 6.6)
											.offset(x: geo.size.width / 5.3, y: -geo.size.height / 4)
                                    }
                                    .overlay{
                                        if isCorrect{
                                            Image("Mobil")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geo.size.width / 16)
                                                .offset(x: carX, y: carY)
                                        }
                                    }
                                    .overlay{
										Image("sekolah")
											.resizable()
											.scaledToFit()
											.frame(width: geo.size.width / 8.8)
											.offset(x: geo.size.width / 4.5, y: -geo.size.height / 9.5)
                                    }
                                    .overlay(
                                        Image("kantor")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width / 9.7)
                                            .offset(x: geo.size.width / 3.3, y: -geo.size.height / 6)
                                            .shadow(color: Color("Cream"), radius: shadowIsShining ? 20 : 10)
                                            .onTapGesture(perform: {
                                                if isCorrect == false{
                                                    isCorrect = true
                                                    carX = -geo.size.width / 24
                                                    carY = -geo.size.width / 8.5
                                                    
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                        withAnimation(.easeIn(duration: 1)) {
                                                                    carX = -geo.size.width / 60
                                                                    carY = -geo.size.width / 7.9
                                                                }
                                                            }
                                                    
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                                                        withAnimation(.easeInOut(duration: 2)) {
                                                            carX = geo.size.width / 10.5
                                                            carY = -geo.size.height / 13
                                                        }
                                                    }
                                                    
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5){
                                                        withAnimation(.easeInOut(duration: 2)) {
                                                            carX = geo.size.width / 3.8
                                                            carY = -geo.size.height / 4.8
                                                        }
                                                    }
                                                    
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 6){
                                                        withAnimation{
                                                            page = "visualNovel11"
                                                        }
                                                    }
                                                }
                                            })
                                    )
                                    .overlay{
                                        if isCorrect == false{
                                            Image("mark")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geo.size.width / 14)
                                                .offset(x: geo.size.width / 3.29, y: jump ? -geo.size.height / 4 : -geo.size.height / 4.2)
                                                .task{
                                                    withAnimation(.easeInOut(duration: 1).repeatForever()) {
                                                        jump.toggle()
                                                    }
                                                    
                                                    withAnimation(.easeInOut(duration: 3).repeatForever()) {
                                                        cloudIsMoving.toggle()
                                                    }
                                                    
                                                    withAnimation(.easeInOut(duration: 1).repeatForever()) {
                                                        shadowIsShining.toggle()
                                                    }
                                                }
                                        }
                                    }
                                    .padding(.leading, geo.size.width / 12)
                                    .padding(.top, geo.size.width / 40)
                            }
                        }
                        .padding(.top, geo.size.height / 15)
                    }
                    
                )
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
								// munculin dialog, trus balik ke main map
								showGlosarium = true
							}label: {
								Image("Glosarium")
									.resizable()
									.scaledToFit()
							}
							.fullScreenCover(isPresented: $showGlosarium) {
								GlosariumModal(showGlosarium: $showGlosarium)
									.background(BackgroundBlurLayout())
									.ignoresSafeArea()
							}
							.frame(width: geoScreen.size.width / 18)
                            
                            Button{
                                // kasi hint minigames ini suruh ngapain
								withAnimation {
									showHint = true
								}
                            }label: {
                                Image("Hint")
                                    .resizable()
                                    .scaledToFit()
                            }
							.onAppear() {
								DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
									withAnimation {
										showHint = true
									}
								}
							}
                            .frame(width: geoScreen.size.width / 18)
                        }
                        .padding(.leading, geoScreen.size.width / 11)
                        .padding(.trailing, geoScreen.size.width / 10)
                        .padding(.top, geoScreen.size.height / 12)
                        
                        Spacer()
                    }
                }
				.overlay {
					if showHint {
						HintLayout(showHint: $showHint, page: page)
							.offset(x: geoScreen.size.width / 1.95, y: geoScreen.size.height / 16.3)
							.transition(.opacity)
					}
				}
        }
        .onAppear{
            startMusicChallenge()
        }
        .onDisappear {
            audioPlayer?.stop()
        }
        .ignoresSafeArea()
    }
}

struct RequestWitholdingTaxCertificateView_Previews: PreviewProvider {
    static var previews: some View {
        RequestWitholdingTaxCertificateView(page: .constant("mintaBuktiPotong"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
