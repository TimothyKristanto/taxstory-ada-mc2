//
//  MapCase.swift
//  TaxStory
//
//  Created by Alex Lim on 29/06/23.
//

import SwiftUI

struct MapCase: View {
    @State private var isAnimating = false
    @State private var rotationAngle: Angle = .degrees(0)
    @State private var isButtonPressed = false
    @State private var animationCount = 0
    @State private var selectedCase = 0
    @State var hold = false
    @Binding var page: String
    
    var body: some View
    {
        ZStack
        {
            GeometryReader
            { geometry in
                Image("map")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay{
                        VStack
                        {
                            // Building image
                            Button(action:
                                    {
                                selectedCase = 1
                                // Start game action
                                withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                                {
                                    //startGame()
                                    isButtonPressed = true
                                }
                            })
                            {Image("point1")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .rotationEffect(.degrees(isButtonPressed ? 10 : -10))
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/10)
                                
                            }
                            .offset(y: -geometry.size.height / 3.5)
                            .offset(x: -geometry.size.height / 3)
                        }
                        .onAppear
                        {
                            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                            {
                                isButtonPressed = true
                            }
                        }
                        VStack
                        {
                            // Building image
                            Button(action:
                                    {
                                selectedCase = 2
                                // Start game action
                                withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                                {
                                    //                                    startGame()
                                    isButtonPressed = true
                                }
                            })
                            {Image("point2")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .rotationEffect(.degrees(isButtonPressed ? -10 : 10))
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/10)
                                
                            }
                            .offset(y: -geometry.size.height / 12.5)
                            .offset(x: -geometry.size.height / 5)
                        }
                        .onAppear
                        {
                            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                            {
                                isButtonPressed = true
                            }
                        }
                        VStack
                        {
                            // Building image
                            Button(action:
                                    {
                                selectedCase = 3
                                withAnimation
                                {
                                }
                                // Start game action
                                withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                                {
                                    //                                    startGame()
                                    isButtonPressed = true
                                }
                            })
                            {Image("point3")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .rotationEffect(.degrees(isButtonPressed ? 10 : -10))
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/10)
                                
                            }
                            .offset(y: -geometry.size.height / 8.5)
                            .offset(x: geometry.size.height / 15)
                        }
//                        /Users/alex/Documents/Apple/MC2/taxstory-ada-mc2/TaxStory/Views/MapCase/MapCase.swift
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                                isButtonPressed = true
                            }
                        }
                        
                        VStack
                        {
                            // Building image
                            Button(action:
                                    {
                                selectedCase = 4
                                // Start game action
                                withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                                {
                                    //                                    startGame()
                                    isButtonPressed = true
                                }
                            })
                            {Image("point4")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .rotationEffect(.degrees(isButtonPressed ? -10 : 10))
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/10)
                                
                            }
                            .offset(y: geometry.size.height / 60.5)
                            .offset(x: geometry.size.height / 3.4)
                        }
                        .onAppear
                        {
                            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                            {
                                isButtonPressed = true
                            }
                        }
                    }
                VStack
                {
                    // guide text
                    Spacer()
                    HStack
                    {
                        Image("bayu-pilih-form")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width / 5)
                            .offset(y: -geometry.size.height / 45.85)
                            .offset(x: geometry.size.height / 25.55)
                        Image("textbox")
                            .resizable()
                            .scaledToFit()
                            .padding(.top, geometry.size.height / 7)
                            .offset(y: -geometry.size.height / 1000.85)
                            .offset(x: geometry.size.height / 200.55)
                            .frame(width: geometry.size.width / 1.4)
                            .overlay(
                                Text(textDescription())
                                    .font(.system(size: geometry.size.width / 65, design: .rounded))
                                    .foregroundColor(Color("Dark Brown"))
                                    .bold()
                                    .padding(.horizontal, geometry.size.width / 12)
                                    .padding(.top, geometry.size.height / 10)
                            )
                            .overlay(
                                Button(action: {
                                    if selectedCase == 1 {
                                        page = "case1"
                                    } else if selectedCase == 2 {
                                        page = "case2"
                                    } else if selectedCase == 3 {
                                        page = "case3"
                                    } else if selectedCase == 4 {
                                        page = "case4"
                                    }
                                }) {
                                    Text("")
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color.black)
                                        .clipShape(Rectangle())
                                        .background(Color.red)
                                }
                                .offset(x: geometry.size.height / 2.5)
                                .offset(y: geometry.size.height / 10)
                            )

                    }
                }
                .padding(.bottom, geometry.size.height / 72.2)
                .padding(.trailing, geometry.size.width / 1)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
            
        }
        
    }
    
    
    private func textDescription() -> String
    {
        switch selectedCase
        {
        case 1:
            return "Pada sistem perpajakan di Indonesia, seorang Wajib Pajak tentu harus memiliki NPWP dan memiliki nomor EFIN. Yuk bantu Bayu membuat NPWP dan EFIN…."
        case 2:
            return "Di tahun pertama bekerja, Bayu mendapatkan gaji sebesar Rp 4,5 juta per bulan. Yuk bantu Bayu dalam lapor SPT……"
        case 3:
            return "Di tahun kedua bekerja, Bayu mendapatkan kenaikan gaji sebesar 1,2 juta.  Nampaknya PPh21 Bayu sudah tidak nihil lagi. Yuk bantu Bayu mengisi laporan SPT nya...."
        case 4:
            return "Coming soon"
        default:
            return "Select Your Cases"
        }
    }
}

struct MapCase_Previews: PreviewProvider {
    static var previews: some View {
        MapCase(page: .constant("mapCase"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
