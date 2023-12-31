//
//  ReportAssetView.swift
//  TaxStory
//
//  Created by Verrell Sutanto on 04/07/23.
//

import SwiftUI
import AVFoundation

struct ReportAssetView: View {
    @State var modalPresentTanah = false
    @State var modalPresentRumah = false
    @State var modalPresentMobil = false
    @State var modalPresentMotor = false
    
    @State var listGambar:[String] = []
	@State var showMapModal = false
	@State var showHint = false
	@State var showGlosarium = false
    
    @State var modalTanahAppended = false
    @State var modalRumahAppended = false
    @State var modalMobilAppended = false
    @State var modalMotorAppended = false
    
    @State var audioPlayer: AVAudioPlayer?
	
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

    
    var isButtonLaporkanDisabled: Bool {
            return modalMobilAppended && modalMotorAppended && modalTanahAppended && modalRumahAppended
        }
    
    var body: some View {
        GeometryReader{ geoScreen in
            Image("bg")
                .resizable()
				.frame(width: Constants.screenWidth, height: Constants.screenHeight)
                .scaledToFill()
                .overlay{
                    VStack{
                        HStack{
                            Button{
                                // munculin dialog, trus balik ke main map
								showMapModal = true
                            }label: {
                                Image("Map-2")
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
                                            Image(systemName: "circle.fill")
												.foregroundColor(Color("Dark Brown"))
											
                                            Text("Lapor Harta")
                                                .font(.title2)
												.foregroundColor(Color("Dark Brown"))
                                        }
                                        
                                        HStack{
                                            Image(systemName: "circle")
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
                .overlay{
                    GeometryReader { geoMid in
                        
                        Image("CanvasLaporHarta")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geoMid.size.width / 1.53, height: geoMid.size.height / 1)
                            .offset(x: geoMid.size.width / 3.8, y: geoMid.size.height / 30)
                        
                        Button{
                            modalPresentTanah = true
                        }label: {
                            Image("Tanah")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: geoMid.size.width / 3.1)
                        .offset(x: geoMid.size.width / 3.58, y: geoMid.size.height / 2.6)
                        .disabled(modalTanahAppended)
                        .opacity(modalTanahAppended == true ? 0.5 : 1)
                        
                        Button{
                            modalPresentRumah = true
                        }label: {
                            Image("Rumah")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: geoMid.size.width / 4)
                        .offset(x: geoMid.size.width / 3, y: geoMid.size.height / 3.3)
                        .disabled(modalRumahAppended)
                        .opacity(modalRumahAppended == true ? 0.5 : 1)
                        
                        Button{
                            modalPresentMotor = true
                        }label: {
                            Image("Motor")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: geoMid.size.width / 11)
                        .offset(x: geoMid.size.width / 3.45, y: geoMid.size.height / 2.25)
                        .disabled(modalMotorAppended)
                        .opacity(modalMotorAppended == true ? 0.5 : 1)
                        
                        Button{
                            modalPresentMobil = true
                        }label: {
                            Image("Mobil1")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: geoMid.size.width / 11)
                        .offset(x: geoMid.size.width / 2.6, y: geoMid.size.height / 1.9)
                        .disabled(modalMobilAppended)
                        .opacity(modalMobilAppended == true ? 0.5 : 1)
                        
                    }
                }
                .overlay{
                    GeometryReader { geoBot in
                        VStack{
                            Spacer()
                            
                            HStack{
                                Image("bayu-pilih-form")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geoBot.size.width / 8)
                                    .offset(x: geoBot.size.width / 10, y: -geoBot.size.height / 9)
                                
                                Image("LaporHarta-07")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geoBot.size.width, height: geoBot.size.height / 6)
                                    .overlay{
                                        Text("Bayu memiliki 1 bidang tanah, 1 rumah, 1 mobil, dan 1 motor. Cara mendaftarkannya adalah klik pada setiap aset Bayu, kemudian pada layar detail harta pilih pilihan yang sesuai dengan data yang seharusnya dilaporkan. Kemudian tekan tombol tambah.")
                                            .font(.system(size: geoBot.size.width / 90, design: .rounded))
                                            .foregroundColor(Color("Dark Brown"))
                                            .bold()
											.padding(.horizontal, geoBot.size.width / 2.8)
//											.padding(.leading, geoBot.size.width / 2.8)
//											.padding(.trailing, geoBot.size.width / 3)
//                                            .offset(y: -geoBot.size.height / 11.4)
                                    }
									.offset(x: -geoBot.size.width / 4.5, y: -geoBot.size.height / 14)
                                Spacer()
                            }
                            //                            .background(.purple)
                        }
                    }
                }
                .overlay{
                    ZStack{
                        VStack{
                            //                        LazyVGrid(columns: gridItems, spacing: 10) {
                            ForEach(listGambar, id: \.self) { imageName in
                                Image(imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width / 4.3)
                            }
                            //                        }
                            Spacer()
                        }
                        .frame(width: geoScreen.size.width * 0.24, height: geoScreen.size.height * 0.6)
                        //                    .background(.red)
                        .offset(x: geoScreen.size.width / 3.68, y: geoScreen.size.height / 10)
                        
                        VStack{
                            Spacer()
                            Button {
                                // change page
								withAnimation {
									page = "visualNovel17"
								}
                            } label: {
                                Image("Laporkan")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geoScreen.size.width, height: geoScreen.size.height / 16)
                                    
                            }
							.offset(y: -geoScreen.size.height / 21)
                            .disabled(isButtonLaporkanDisabled == false)
                                               .opacity(isButtonLaporkanDisabled == true ? 1 : 0.5)
                        }
                        .frame(width: geoScreen.size.width * 0.24, height: geoScreen.size.height * 0.6)
                        .offset(x: geoScreen.size.width / 3.68, y: geoScreen.size.height / 10)
                        
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
        .fullScreenCover(isPresented: $modalPresentTanah, content: {
            ReportAssetTanahView(modalPresentTanah: $modalPresentTanah, listGambar: $listGambar, modalTanahAppended: $modalTanahAppended)
                .background(BackgroundBlurLayout())
                .ignoresSafeArea()
        })
        .fullScreenCover(isPresented: $modalPresentRumah, content: {
            ReportAssetRumahView(modalPresentRumah: $modalPresentRumah, listGambar: $listGambar, modalRumahAppended: $modalRumahAppended)
                .background(BackgroundBlurLayout())
                .ignoresSafeArea()
        })
        .fullScreenCover(isPresented: $modalPresentMobil, content: {
            ReportAssetMobilView(modalPresentMobil: $modalPresentMobil, listGambar: $listGambar, modalMobilAppended: $modalMobilAppended)
                .background(BackgroundBlurLayout())
                .ignoresSafeArea()
        })
        .fullScreenCover(isPresented: $modalPresentMotor, content: {
            ReportAssetMotorView(modalPresentMotor: $modalPresentMotor, listGambar: $listGambar, modalMotorAppended: $modalMotorAppended)
                .background(BackgroundBlurLayout())
                .ignoresSafeArea()
        })
        .ignoresSafeArea()
    }
}

struct ReportAssetView_Previews: PreviewProvider {
    static var previews: some View {
		ReportAssetView(page: .constant("laporHarta"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
