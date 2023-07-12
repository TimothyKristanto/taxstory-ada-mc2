//
//  RequestWitholdingTaxCertificateView.swift
//  TaxStory
//
//  Created by Timothy on 25/06/23.
//

import SwiftUI

struct RequestWitholdingTaxCertificateView: View {
    @State var jump = false
    @State var cloudIsMoving = false
    @State var shadowIsShining = false
    @State var isCorrect = false
    
    @State var carX: CGFloat = 0
    @State var carY: CGFloat = 0
    
	@State var showMapModal = false
	
    @Binding var page: String
    
    var body: some View {
        GeometryReader{ geoScreen in
            Image("bg")
                .resizable()
                .scaledToFill()
                .overlay (
                    GeometryReader{ geo in
                        VStack{
                            ZStack{
                                Image("map-bukti-potong")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width / 1.15)
                                    .overlay(
                                        Image("Awan")
                                            .resizable()
                                            .scaledToFit()
                                            .offset(x: cloudIsMoving ? geo.size.width / 25 : geo.size.width / 40)
                                            .offset(y: cloudIsMoving ? geo.size.height / 40 : geo.size.height / 55)
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
                                                        .offset(y: geo.size.height / 105)
                                                    
                                                    Image("bayu-minta-bukti-potong")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: geo.size.width / 5, height: geo.size.height / 4.5)
                                                        .offset(x: -geo.size.width / 40)
                                                        .offset(y: -geo.size.height / 55)
                                                }
                                            }
                                        }
                                    )
                                    .overlay{
                                        if isCorrect == false{
                                            Image("bensin")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geo.size.width / 15)
                                                .offset(x: geo.size.width / 80, y: geo.size.height / 20)
                                                .shadow(color: Color("Cream"), radius: shadowIsShining ? 20 : 10)
                                        }else{
                                            Image("bensin")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geo.size.width / 15)
                                                .offset(x: geo.size.width / 80, y: geo.size.height / 20)
                                        }
                                        }
                                    .overlay{
                                        if isCorrect == false{
                                            Image("Cafe")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geo.size.width / 18)
                                                .offset(x: geo.size.width / 7.5, y: -geo.size.height / 22)
                                                .shadow(color: Color("Cream"), radius: shadowIsShining ? 20 : 10)
                                        }else{
                                            Image("Cafe")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geo.size.width / 18)
                                                .offset(x: geo.size.width / 7.5, y: -geo.size.height / 22)
                                        }
                                        }
                                    .overlay{
                                        if isCorrect == false{
                                            Image("Hospital")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geo.size.width / 7.5)
                                                .offset(x: geo.size.width / 10.6, y: -geo.size.height / 5.98)
                                                .shadow(color: Color("Cream"), radius: shadowIsShining ? 20 : 10)
                                        }else{
                                            Image("Hospital")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geo.size.width / 7.5)
                                                .offset(x: geo.size.width / 10.6, y: -geo.size.height / 5.98)
                                        }
                                    }
                                    .overlay{
                                        if isCorrect == false{
                                            Image("kantor-polisi")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geo.size.width / 6.6)
                                                .offset(x: geo.size.width / 5.3, y: -geo.size.height / 4)
                                                .shadow(color: Color("Cream"), radius: shadowIsShining ? 20 : 10)
                                        }else{
                                            Image("kantor-polisi")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geo.size.width / 6.6)
                                                .offset(x: geo.size.width / 5.3, y: -geo.size.height / 4)
                                        }
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
                                        if isCorrect == false{
                                            Image("sekolah")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geo.size.width / 8.8)
                                                .offset(x: geo.size.width / 4.5, y: -geo.size.height / 9.5)
                                                .shadow(color: Color("Cream"), radius: shadowIsShining ? 20 : 10)
                                        }else{
                                            Image("sekolah")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geo.size.width / 8.8)
                                                .offset(x: geo.size.width / 4.5, y: -geo.size.height / 9.5)
                                        }
                                    }
                                    .overlay(
                                        Image("kantor")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width / 9.7)
                                            .offset(x: geo.size.width / 3.3, y: -geo.size.height / 6)
                                            .shadow(color: Color("Cream"), radius: shadowIsShining ? 20 : 10)
                                            .onTapGesture(perform: {
                                                // coordinate: (-geo.size.width / 24, -geo.size.width / 8.5), (-geo.size.width / 60, -geo.size.width / 7.9), (geo.size.width / 10.5, -geo.size.height / 13), (geo.size.width / 3.8, -geo.size.height / 4.8)
                                                
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
                                                            page = "isiBuktiPotong"
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
