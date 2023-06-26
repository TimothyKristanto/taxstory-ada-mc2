//
//  FillFormulir.swift
//  TaxStory
//
//  Created by Alex Lim on 26/06/23.
//

import SwiftUI

struct FillFormulir: View {
    var body: some View {
            VStack{
                Image("bg-pilih-form")
                    .resizable()
                    .scaledToFill()
                    .frame(width: Constants.screenWidth, height: Constants.screenHeight/1.3)
                    .overlay {
                        HStack{
                            // task list
                            VStack{
                                VStack{
                                    Image("Quest")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: Constants.screenWidth / 5)
                                }
                                .overlay(
                                    VStack{
                                        Text("Quest")
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(.white)
                                            .padding(.top, Constants.screenHeight / 180)
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading){
                                            HStack{
                                                Image(systemName: "circle.fill")
                                                
                                                Text("Pilih form")
                                                    .font(.title2)
                                            }
                                            
                                            HStack{
                                                Image(systemName: "circle.fill")
                                                
                                                Text("Minta bukti potong")
                                                    .font(.title2)
                                            }
                                            
                                            HStack{
                                                Image(systemName: "circle")
                                                
                                                Text("Isi formulir")
                                                    .font(.title2)
                                            }
                                            
                                            HStack{
                                                Image(systemName: "circle")
                                                
                                                Text("PTKP")
                                                    .font(.title2)
                                            }
                                            
                                            HStack{
                                                Image(systemName: "circle")
                                                
                                                Text("Result")
                                                    .font(.title2)
                                            }
                                        }
                                        .padding(.horizontal, Constants.screenWidth / 30)
                                        .padding(.top, Constants.screenHeight / 35)
                                        
                                        Spacer()
                                    }
                                )
                                .padding(.leading, Constants.screenWidth / 12.5)
                                .padding(.top, Constants.screenHeight / 12.5)
                                
                                
                                Spacer()
                            }

                            //Bukti Potong
                            VStack{
                                Image("FormSPT")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: Constants.screenWidth / 1.9)
                            }
                            
                            Spacer()



//                            // pilih form
//                            VStack{
//                                VStack{
//
//                                }
//
//
//                                Spacer()
//                            }
//
//                            Spacer()
                        }
                        
                        
                        
                        VStack{
                            // guide text
                            Spacer()
                            
                            HStack{
                                Image("bayu-pilih-form")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: Constants.screenWidth / 8)
                                    .padding(.leading, Constants.screenWidth / 9)
                                    .padding(.bottom, Constants.screenHeight / 35)
                                
                                Image("text-guide-pilih-form")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.top, Constants.screenWidth / 15)
                                    .frame(width: Constants.screenWidth / 1.6)
                                    .overlay(
                                        Text("Hello")
                                            .font(.title)
                                            .bold()
                                            .padding(.top, 15)
                                    )
                                
                                Spacer()
                            }
                        }
                        .padding(.bottom, Constants.screenHeight / 12)
                    }
                
                
            }
        }
}

struct FillFormulir_Previews: PreviewProvider {
    static var previews: some View {
        FillFormulir()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

