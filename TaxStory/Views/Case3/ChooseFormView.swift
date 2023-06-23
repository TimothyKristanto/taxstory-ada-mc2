//
//  ChooseForm.swift
//  TaxStory
//
//  Created by Timothy on 22/06/23.
//

import SwiftUI

struct ChooseFormView: View {
    @State var calculatorResult = "0"
    @State var hasCalculated = false
    
    var body: some View {
        VStack{
            HStack{
                // task list
                VStack{
                    VStack{
                        Text("Quest")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom, 5)
                        
                        VStack(alignment: .leading){
                            HStack{
                                Image(systemName: "circle.fill")
                                
                                Text("Pilih form")
                                    .font(.title)
                            }
                            
                            HStack{
                                Image(systemName: "circle")
                                
                                Text("Lapor harta")
                                    .font(.title)
                            }
                            
                            HStack{
                                Image(systemName: "circle")
                                
                                Text("Pilih tipe PTKP")
                                    .font(.title)
                            }
                        }
                    }
                    .padding(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.black, lineWidth: 3)
                    )
                    .padding(.leading)
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(.leading, 20)
                
                Spacer()
                
                // calculator
                VStack{
                    Image("calculatorbody")
                        .resizable()
                        .scaledToFit()
                        .frame(height: Constants.screenHeight / 1.35)
                        .overlay {
                            GeometryReader{ geo in
                                HStack{
                                    Spacer()
                                    
                                    VStack{
                                        Spacer()
                                        
                                        ZStack{
                                            Image("calculatorresult")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: Constants.screenWidth / 3.83)
                                                .padding(.top)
                                                .overlay {
                                                    VStack{
                                                        HStack{
                                                            Spacer()
                                                            
                                                            Text(calculatorResult)
                                                                .font(.largeTitle)
                                                                .bold()
                                                                .padding(.trailing, geo.size.width / 12)
                                                                .padding(.top)
                                                        }
                                                    }
                                                }
                                        }
                                        
                                        HStack{
                                            Button{
                                                if !hasCalculated{
                                                    calculatorResult = "0"
                                                }
                                            }label: {
                                                Image("ac")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 3.5)
                                            }
                                            
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "%"
                                                        }
                                                    }
                                                }
                                            }label: {
                                                Image("persen")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                                    .padding(.horizontal, 5)
                                            }
                                            
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "/"
                                                        }
                                                    }
                                                }
                                            }label: {
                                                Image("bagi")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                        }
                                        
                                        HStack{
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "1"
                                                        }
                                                    }else if calculatorResult == "0"{
                                                        calculatorResult = "1"
                                                    }
                                                }
                                            }label: {
                                                Image("1")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "2"
                                                        }
                                                    }else if calculatorResult == "0"{
                                                        calculatorResult = "2"
                                                    }
                                                }
                                            }label: {
                                                Image("2")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "3"
                                                        }
                                                        
                                                    }else if calculatorResult == "0"{
                                                        calculatorResult = "3"
                                                    }
                                                }
                                            }label: {
                                                Image("3")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "x"
                                                        }
                                                        
                                                    }
                                                }
                                            }label: {
                                                Image("kali")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                        }
                                        
                                        HStack{
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "4"
                                                        }
                                                        
                                                    }else if calculatorResult == "0"{
                                                        calculatorResult = "4"
                                                    }
                                                }
                                            }label: {
                                                Image("4")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "5"
                                                        }
                                                        
                                                    }else if calculatorResult == "0"{
                                                        calculatorResult = "5"
                                                    }
                                                }
                                            }label: {
                                                Image("5")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "6"
                                                        }
                                                        
                                                    }else if calculatorResult == "0"{
                                                        calculatorResult = "6"
                                                    }
                                                }
                                            }label: {
                                                Image("6")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "-"
                                                        }
                                                        
                                                    }
                                                }
                                            }label: {
                                                Image("minus")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                        }
                                        
                                        HStack{
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "7"
                                                        }
                                                        
                                                    }else if calculatorResult == "0"{
                                                        calculatorResult = "7"
                                                    }
                                                }
                                            }label: {
                                                Image("7")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "8"
                                                        }
                                                        
                                                    }else if calculatorResult == "0"{
                                                        calculatorResult = "8"
                                                    }
                                                }
                                            }label: {
                                                Image("8")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "9"
                                                        }
                                                        
                                                    }else if calculatorResult == "0"{
                                                        calculatorResult = "9"
                                                    }
                                                }
                                            }label: {
                                                Image("9")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "+"
                                                        }
                                                        
                                                    }
                                                }
                                            }label: {
                                                Image("plus")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                        }
                                        
                                        HStack{
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult != "0" {
                                                        if calculatorResult.count < 10{
                                                            calculatorResult += "0"
                                                        }
                                                    }
                                                }
                                            }label: {
                                                Image("0")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 3.5)
                                            }
                                            
                                            Button{
                                                
                                            }label: {
                                                Image("koma")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                                    .padding(.horizontal, 5)
                                            }
                                            
                                            Button{
                                                if !hasCalculated{
                                                    if calculatorResult == "4500000x12"{
                                                        calculatorResult = "54000000"
                                                        hasCalculated = true
                                                    }
                                                }
                                            }label: {
                                                Image("equal")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                }
                            }
                        }
                    
                    Spacer()
                }
                
                Spacer()
                
                // pilih form
                VStack{
                    VStack{
                        Text("Pilih Form")
                            .font(.largeTitle)
                            .bold()
                        
                        Spacer()
                    }
                    .padding(25)
                    .frame(width: Constants.screenWidth / 3.1, height: Constants.screenHeight / 1.5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.black, lineWidth: 3)
                    )
                    .padding(.top, 10)
                    
                    Spacer()
                }
                
                Spacer()
            }
            
            VStack{
                // guide text
                Text("Hello")
            }
        }
    }
}

struct ChooseFormView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseFormView()
            .previewDevice("iPad Pro (12.9-inch) (6th geneeration)")
            .previewInterfaceOrientation(.landscapeLeft)
        
        ChooseFormView()
            .previewDevice("iPad mini (6th geneeration)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
