//
//  ReportAssetView.swift
//  TaxStory
//
//  Created by Verrell Sutanto on 04/07/23.
//

import SwiftUI

struct ReportAssetView: View {
    @State var modalPresentTanah = false
    @State var modalPresentRumah = false
    @State var modalPresentMobil = false
    @State var modalPresentMotor = false
    
    @State var listGambar:[String] = []
	@State var showMapModal = false
    
    @State var modalTanahAppended = false
    @State var modalRumahAppended = false
    @State var modalMobilAppended = false
    @State var modalMotorAppended = false
	
	@Binding var page: String
    
//    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader{ geoScreen in
            Image("bg")
                .resizable()
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
                        
                        //                        Button{
                        //                        }label: {
                        //                            Image("Mobil2")
                        //                                .resizable()
                        //                                .scaledToFit()
                        //                        }
                        //                        .frame(width: geoMid.size.width / 12)
                        //                        .background(.red)
                        //                        .offset(x: geoMid.size.width / 3.45, y: geoMid.size.height / 2.25)
                        
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
                                    .offset(x: -geoBot.size.width / 4.5, y: -geoBot.size.height / 12)
                                    .overlay{
                                        Text("Sejauh ini Bayu telah memiliki 1 rumah, 2 mobil, dan 1 motor. Cara mendaftarkannya adalah klik pada setiap aset Bayu, kemudian pada layar detail harta pilih pilihan yang sesuai dengan data yang seharusnya dilaporkan. Kemudian tekan tombol tambah.")
                                            .font(.system(size: geoBot.size.width / 83, design: .rounded))
                                            .foregroundColor(Color("Dark Brown"))
                                            .bold()
                                            .padding(.leading, geoBot.size.width / 8)
                                            .padding(.trailing, geoBot.size.width / 1.8)
                                            .offset(y: -geoBot.size.height / 11.4)
                                    }
                                Spacer()
                            }
                            //                            .background(.purple)
                        }
                    }
                }
                .overlay{
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
                }
        }
        .fullScreenCover(isPresented: $modalPresentTanah, content: {
            ReportAssetTanahView(modalPresentTanah: $modalPresentTanah, listGambar: $listGambar, modalTanahAppended: $modalTanahAppended)
//                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.85)
                .background(BackgroundBlurLayout())
                .ignoresSafeArea()
        })
        .fullScreenCover(isPresented: $modalPresentRumah, content: {
            ReportAssetRumahView(modalPresentRumah: $modalPresentRumah, listGambar: $listGambar, modalRumahAppended: $modalRumahAppended)
//                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.85)
                .background(BackgroundBlurLayout())
                .ignoresSafeArea()
        })
        .fullScreenCover(isPresented: $modalPresentMobil, content: {
            ReportAssetMobilView(modalPresentMobil: $modalPresentMobil, listGambar: $listGambar, modalMobilAppended: $modalMobilAppended)
//                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.85)
                .background(BackgroundBlurLayout())
                .ignoresSafeArea()
        })
        .fullScreenCover(isPresented: $modalPresentMotor, content: {
            ReportAssetMotorView(modalPresentMotor: $modalPresentMotor, listGambar: $listGambar, modalMotorAppended: $modalMotorAppended)
//                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.85)
                .background(BackgroundBlurLayout())
                .ignoresSafeArea()
        })
        .ignoresSafeArea()
    }
}

//struct BackgroundClearView: UIViewRepresentable {
//    func makeUIView(context: Context) -> some UIView {
//        let view = UIView()
//        DispatchQueue.main.async {
//            view.superview?.superview?.backgroundColor = .clear
//        }
//        return view
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) { }
//}

struct ReportAssetView_Previews: PreviewProvider {
    static var previews: some View {
		ReportAssetView(page: .constant("laporHarta"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
