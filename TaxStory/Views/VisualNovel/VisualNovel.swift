//
//  CobaPakSupir.swift
//  TaxStory
//
//  Created by Alex Lim on 11/07/23.
//

import SwiftUI
import AVFoundation

struct VisualNovel: View {
	@State var visualNovelSceneCount: Int
	@State var showMapModal = false
	@Binding var page: String
    @State var audioPlayer: AVAudioPlayer?
    
    func startMusicNovel() {
        //code to start the music and loop
        guard let path = Bundle.main.path(forResource: "visualnovel", ofType: "mp3") else {
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
        

        
        GeometryReader { geoScreen in
            VStack {
//                Text("Tap Count: \(tapCount)")
//                    .foregroundColor(.white)
//                    .font(.title)
                
//                ForEach((1...18), id: \.self) { index in
                    Image("previewNovel\(visualNovelSceneCount)")
                        .resizable()
						.frame(width: Constants.screenWidth, height: Constants.screenHeight)
                        .scaledToFill()
                        .ignoresSafeArea()
                        .overlay(
                            //actionya sini ya timmy tinggal sikat jangan sampe NT actionya
							Button{
								showMapModal = true
							}label: {
                                Text("")
                                    .frame(width: 100, height: 80)
                                    .foregroundColor(Color.white)
//                                    .background(Color.black)
                                    .clipShape(Circle())

                            }
								.fullScreenCover(isPresented: $showMapModal, content: {
									WarningMapModal(showMapModal: $showMapModal, page: $page)
								})
                            .offset(x: -geoScreen.size.height / 1.653)
                            .offset(y: -geoScreen.size.height / 2.141))
//                }
            }
            .onAppear{
                startMusicNovel()
            }
            .onDisappear {
                audioPlayer?.stop()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .onTapGesture {
				if visualNovelSceneCount == 5 {
					withAnimation {
						page = "mapCase"
					}
				} else if visualNovelSceneCount == 7 {
					withAnimation {
						page = "pilihFormSPT"
					}
				} else if visualNovelSceneCount == 10 {
					withAnimation {
						page = "mintaBuktiPotong"
					}
				} else if visualNovelSceneCount == 13 {
					withAnimation {
						page = "isiBuktiPotong"
					}
				} else if visualNovelSceneCount == 16 {
					withAnimation {
						page = "laporHarta"
					}
				} else if visualNovelSceneCount == 18 {
					withAnimation {
						page = "pilihPTKP"
					}
				} else {
					visualNovelSceneCount += 1
				}
            }
        }
    }
}

struct VisualNovel_Previews: PreviewProvider {
    static var previews: some View {
		VisualNovel(visualNovelSceneCount: 1, page: .constant("visualNovel"))
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
