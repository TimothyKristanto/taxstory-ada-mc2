//
//  FillFormulir.swift
//  TaxStory
//
//  Created by Alex Lim on 26/06/23.
//


import SwiftUI

struct FillFormulir: View {
    @State private var currentImageIndex = 0
    
    var body: some View {
        VStack{
            Image("bg-pilih-form")
                .resizable()
                .scaledToFill()
                .overlay {
                    HStack{
                        // task list
                        VStack{
                            VStack{
                                Image("Quest")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: Constants.screenWidth / 5.5)
                            }
                            .overlay(
                                VStack{
                                    Text("Quest")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding(.top, Constants.screenHeight / 110)
                                    
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
                                    .padding(.horizontal, Constants.screenWidth / 25)
                                    .padding(.top, Constants.screenHeight / 40)
                                    
                                    Spacer()
                                }
                            )
                            .padding(.leading, Constants.screenWidth / 9.5)
                            .padding(.top, Constants.screenHeight / 11)
                            
                            
                            Spacer()
                        }
                        
                        // SPTForm
                        VStack{
                            VStack{
                                Image("FormSPT")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: Constants.screenWidth / 3.7)
                                    .padding(.leading, Constants.screenWidth / 55)
                                    .padding(.top, Constants.screenHeight / 9)
                            }
                            Spacer()
                        }
                    
                        
                        // DataBuktiPotong
                        VStack{
                            VStack{
                                Image("buktipotongfix")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: Constants.screenWidth / 3.1)
                                    .padding(.leading, Constants.screenWidth / 79)
                                    .padding(.top, Constants.screenHeight / 11)

                                
                            }
                            .overlay(
                                VStack{
                                    VStack{
                                        Image("page1puzzle2")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: Constants.screenWidth / 12)
                                            .padding(.leading, Constants.screenWidth / 39)
                                            .padding(.top, Constants.screenHeight / 3.68)
                                    }
                                    Spacer()
                                }
                            )
                            .overlay(
                                VStack{
                                    VStack{
                                        Image("page1puzzle1")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: Constants.screenWidth / 14)
                                            .padding(.leading, Constants.screenWidth / 100000)
                                            .padding(.top, Constants.screenHeight / 3.1)
                                    }
                                    Spacer()
                                }
                            )
                            .overlay(
                                VStack{
                                    VStack{
                                        Image("page1puzzle3")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: Constants.screenWidth / 13)
                                            .padding(.leading, Constants.screenWidth / 100)
                                            .padding(.top, Constants.screenHeight / 2.9)
                                    }
                                    Spacer()
                                }
                            )
                            .overlay(
                                VStack{
                                    Spacer()
                                        HStack{
                                            Spacer()
                                            Button(action: {
                                                //                                currentImageIndex = (currentImageIndex - 1 + imageNames.count) % imageNames.count
                                            }) {
                                                Image(systemName: "chevron.left.circle")
                                                    .font(.title)
//                                                    .padding(.leading, Constants.screenWidth / 20)
                                                    .foregroundColor(.brown)
                                                    .padding(.bottom, Constants.screenHeight / 25)
                                            }
//                                            Spacer()
                                            Button(action: {
                                                //                                currentImageIndex = (currentImageIndex + 1) % imageNames.count
                                            }) {
                                                Image(systemName: "chevron.right.circle")
                                                    .font(.title)
//                                                    .padding(.leading, Constants.screenWidth / 20)
                                                    .foregroundColor(.brown)
                                                    .padding(.bottom, Constants.screenHeight / 25)
                                            }
                                            Spacer()
                                        }
                                }
                            )
                            
                            Spacer()
                        

                        }
                    
                    Spacer()
                }
                  
                VStack{
                    // guide text
                    Spacer()
                    
                    HStack{
                        Image("bayu-pilih-form")
                            .resizable()
                            .scaledToFit()
                            .frame(width: Constants.screenWidth / 8)
                            .padding(.leading, Constants.screenWidth / 8)
                            .padding(.top, Constants.screenHeight / 15)
                        
                        Image("text-guide-pilih-form")
                            .resizable()
                            .scaledToFit()
                            .padding(.top, Constants.screenHeight / 8)
                            .frame(width: Constants.screenWidth / 1.48)
                            .overlay(
                                Text("Nanti ditaru  ")
                                    .font(.title2)
                                    .bold()
                                    .padding(.top, Constants.screenHeight / 10)
                                    .padding(.horizontal, Constants.screenWidth / 15)
                            )
                    }
                }
                .padding(.bottom, Constants.screenHeight / 10)
                .padding(.trailing, Constants.screenWidth / 9)
            }
            
            }
        .ignoresSafeArea()
        }
}

struct FillFormulir_Previews: PreviewProvider {
    static var previews: some View {
        FillFormulir()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
