//
//  ChooseForm.swift
//  TaxStory
//
//  Created by Timothy on 22/06/23.
//

import SwiftUI

struct ChooseFormView: View {
    @State var calculatorResult = ""
    @State var calculatorOperator = ""
    @State var lastNumber: Double = 0
    @State var isResetNumber = true
    @State var show1770Warning = false
    @State var show1770ssWarning = false
	@State var showMapModal = false
	@State var showHint = false
    
    @Binding var page: String
    
    let maxCalculatorChara = 11
    
    func changeCalculatorResultToScientific() {
        if calculatorResult.count > 10 {
             let numberFormatter = NumberFormatter()
             numberFormatter.numberStyle = .scientific
            calculatorResult = numberFormatter.string(from: Double(calculatorResult.split(separator: ",").joined())! as NSNumber)!
        }
    }
    
    func giveSeparatorNumDot(num: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "en")
        formatter.maximumFractionDigits = 2
        let formattedNum = formatter.string(from: Double(num)! as NSNumber) ?? ""
        return formattedNum
    }
    
    func containDecimal(num: Double) -> Bool {
        if num - floor(num) > 0 {
            return true
        }
        
        return false
    }
    
    func giveComma() {
        if calculatorResult.contains(".") == false && calculatorResult != "0" {
            calculatorResult += "."
        }
    }
    
    func calculate(){
        if (calculatorResult == "0" && calculatorOperator == "/") || calculatorResult == "ERROR"{
            calculatorResult = "ERROR"
            return
        }
        
        if calculatorOperator == "" {
            lastNumber = Double(calculatorResult.split(separator: ",").joined()) ?? 0
            if containDecimal(num: lastNumber) == false{
                calculatorResult = String(Int(lastNumber))
            }else{
                calculatorResult = String(lastNumber)
            }
            calculatorResult = giveSeparatorNumDot(num: calculatorResult)
            return
        }
        
        switch(calculatorOperator){
            case "+":
                if calculatorResult != ""{
                    lastNumber = lastNumber + Double(calculatorResult.split(separator: ",").joined())!
                }
            case "-":
                if calculatorResult != ""{
                    lastNumber = lastNumber - Double(calculatorResult.split(separator: ",").joined())!
                }
            case "x":
                if calculatorResult != ""{
                    lastNumber = lastNumber * Double(calculatorResult.split(separator: ",").joined())!
                }
            case "/":
                if calculatorResult != ""{
                    lastNumber = lastNumber / Double(calculatorResult.split(separator: ",").joined())!
                }
            case "%":
                if calculatorResult != ""{
                    lastNumber = lastNumber.truncatingRemainder(dividingBy: Double(calculatorResult.split(separator: ",").joined())!)
                }
            default:
                return
        }
        
        if !containDecimal(num: lastNumber){
            calculatorResult = String(Int(lastNumber))
        }else{
            calculatorResult = String(lastNumber)
        }
        
        calculatorResult = giveSeparatorNumDot(num: calculatorResult)
        changeCalculatorResultToScientific()
    }
    
    var body: some View {
        GeometryReader{ geoScreen in
            VStack{
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
								.fullScreenCover(isPresented: $showMapModal, content: {
									WarningMapModal(showMapModal: $showMapModal, page: $page)
								})
                                .frame(width: geoScreen.size.width / 18)
                                
                                Spacer()
                                
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
                                .frame(width: geoScreen.size.width / 18)
								.onAppear() {
									DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
										withAnimation {
											showHint = true
										}
									}
								}
                            }
                            .padding(.leading, geoScreen.size.width / 11)
                            .padding(.trailing, geoScreen.size.width / 10)
                            .padding(.top, geoScreen.size.height / 12)
                            
                            Spacer()
                        }
                    }
                    .overlay {
                        VStack{
                            HStack{
                                // task list
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
                                                    .padding(.top, geoTop.size.height / 55)
                                                
                                                Spacer()
                                                
                                                VStack(alignment: .leading){
                                                    HStack{
                                                        Image(systemName: "circle.fill")
															.foregroundColor(Color("Dark Brown"))
                                                        
                                                        Text("Pilih form")
															.foregroundColor(Color("Dark Brown"))
                                                            .font(.system(size: geoTop.size.width / 55, design: .rounded))
                                                    }
                                                    
                                                    HStack{
                                                        Image(systemName: "circle")
															.foregroundColor(Color("Dark Brown"))
                                                        
                                                        Text("Minta bukti potong")
															.foregroundColor(Color("Dark Brown"))
                                                            .font(.system(size: geoTop.size.width / 55, design: .rounded))
                                                    }
                                                    
                                                    HStack{
                                                        Image(systemName: "circle")
															.foregroundColor(Color("Dark Brown"))
                                                        
                                                        Text("Isi formulir")
															.foregroundColor(Color("Dark Brown"))
                                                            .font(.system(size: geoTop.size.width / 55, design: .rounded))
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
															.foregroundColor(Color("Dark Brown"))
                                                            .font(.system(size: geoTop.size.width / 55, design: .rounded))
                                                    }
                                                    
                                                    HStack{
                                                        Image(systemName: "circle")
															.foregroundColor(Color("Dark Brown"))
                                                        
                                                        Text("Result")
															.foregroundColor(Color("Dark Brown"))
                                                            .font(.system(size: geoTop.size.width / 55, design: .rounded))
                                                    }
                                                }
                                                .padding(.horizontal, geoTop.size.width / 30)
                                                .padding(.top, geoTop.size.height / 35)
                                                
                                                Spacer()
                                            }
                                        )
                                        .offset(y: geoTop.size.height / 4)
                                        .offset(x: geoTop.size.width / 12)
                                        
                                        Spacer()
                                    }
                                    
                                    // calculator
                                    VStack{
                                        Image("calculatorbody")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geoTop.size.width / 3.15)
                                            .overlay (
                                                GeometryReader{ geo in
                                                    HStack{
                                                        Spacer()
                                                        
                                                        VStack{
                                                            Spacer()
                                                            
                                                            ZStack{
                                                                Image("calculatorresult")
                                                                    .resizable()
                                                                    .scaledToFit()
                                                                    .frame(width: geo.size.width / 1.4)
                                                                    .padding(.top)
                                                                    .overlay {
                                                                        VStack{
                                                                            HStack{
                                                                                Spacer()
                                                                                
                                                                                if calculatorResult != ""{
                                                                                    Text(calculatorResult)
                                                                                        .font(.title)
                                                                                        .bold()
                                                                                        .padding(.trailing, geo.size.width / 12)
                                                                                        .padding(.top)
                                                                                }else{
                                                                                    Text("0")
                                                                                        .font(.largeTitle)
                                                                                        .bold()
                                                                                        .padding(.trailing, geo.size.width / 12)
                                                                                        .padding(.top)
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                            }
                                                            
                                                            HStack{
                                                                Button{
                                                                    calculatorResult = ""
                                                                    lastNumber = 0
                                                                    calculatorOperator = ""
                                                                }label: {
                                                                    Image("ac")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(width: geo.size.width / 3.5)
                                                                }
                                                                
                                                                Button{
                                                                    if calculatorResult != "" {
                                                                        calculate()
                                                                        calculatorOperator = "%"
                                                                        isResetNumber = true
                                                                    }
                                                                }label: {
                                                                    Image("persen")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(width: geo.size.width / 7)
                                                                        .padding(.horizontal, 5)
                                                                }
                                                                
                                                                Button{
                                                                    if calculatorResult != "" {
                                                                        if isResetNumber == false{
                                                                            calculate()
                                                                        }
                                                                        calculatorOperator = "/"
                                                                        isResetNumber = true
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
                                                                    if calculatorResult == "" || isResetNumber == true{
                                                                        calculatorResult = "1"
                                                                        isResetNumber = false
                                                                    } else if calculatorResult != "" {
                                                                        if calculatorResult.count < maxCalculatorChara{
                                                                            calculatorResult += "1"
                                                                            calculatorResult = giveSeparatorNumDot(num: calculatorResult.split(separator: ",").joined())
                                                                        }
                                                                    }
                                                                    
                                                                    
                                                                }label: {
                                                                    Image("1")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(width: geo.size.width / 7)
                                                                }
                                                                
                                                                Button{
                                                                    if calculatorResult == "" || isResetNumber{
                                                                        calculatorResult = "2"
                                                                        isResetNumber = false
                                                                    }else if calculatorResult != "" {
                                                                        if calculatorResult.count < maxCalculatorChara{
                                                                            calculatorResult += "2"
                                                                            calculatorResult = giveSeparatorNumDot(num: calculatorResult.split(separator: ",").joined())
                                                                        }
                                                                    }
                                                                }label: {
                                                                    Image("2")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(width: geo.size.width / 7)
                                                                }
                                                                
                                                                Button{
                                                                    if calculatorResult == "" || isResetNumber{
                                                                        calculatorResult = "3"
                                                                        isResetNumber = false
                                                                    } else if calculatorResult != "" {
                                                                        if calculatorResult.count < maxCalculatorChara{
                                                                            calculatorResult += "3"
                                                                            calculatorResult = giveSeparatorNumDot(num: calculatorResult.split(separator: ",").joined())
                                                                        }
                                                                        
                                                                    }
                                                                }label: {
                                                                    Image("3")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(width: geo.size.width / 7)
                                                                }
                                                                
                                                                Button{
                                                                    if calculatorResult != "" {
                                                                        if isResetNumber == false{
                                                                            calculate()
                                                                        }
                                                                        calculatorOperator = "x"
                                                                        isResetNumber = true
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
                                                                    if calculatorResult == "" || isResetNumber{
                                                                        calculatorResult = "4"
                                                                        isResetNumber = false
                                                                    }else if calculatorResult != "" {
                                                                        if calculatorResult.count < maxCalculatorChara{
                                                                            calculatorResult += "4"
                                                                            calculatorResult = giveSeparatorNumDot(num: calculatorResult.split(separator: ",").joined())
                                                                        }
                                                                        
                                                                    }
                                                                }label: {
                                                                    Image("4")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(width: geo.size.width / 7)
                                                                }
                                                                
                                                                Button{
                                                                    if calculatorResult == "" || isResetNumber{
                                                                        calculatorResult = "5"
                                                                        isResetNumber = false
                                                                    }else if calculatorResult != "" {
                                                                        if calculatorResult.count < maxCalculatorChara{
                                                                            calculatorResult += "5"
                                                                            calculatorResult = giveSeparatorNumDot(num: calculatorResult.split(separator: ",").joined())
                                                                        }
                                                                        
                                                                    }
                                                                }label: {
                                                                    Image("5")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(width: geo.size.width / 7)
                                                                }
                                                                
                                                                Button{
                                                                    if calculatorResult == "" || isResetNumber{
                                                                        calculatorResult = "6"
                                                                        isResetNumber = false
                                                                    }else if calculatorResult != "" {
                                                                        if calculatorResult.count < maxCalculatorChara{
                                                                            calculatorResult += "6"
                                                                            calculatorResult = giveSeparatorNumDot(num: calculatorResult.split(separator: ",").joined())
                                                                        }
                                                                        
                                                                    }
                                                                }label: {
                                                                    Image("6")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(width: geo.size.width / 7)
                                                                }
                                                                
                                                                Button{
                                                                    if calculatorResult != "" {
                                                                        if isResetNumber == false{
                                                                            calculate()
                                                                        }
                                                                        calculatorOperator = "-"
                                                                        isResetNumber = true
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
                                                                    if calculatorResult == "" || isResetNumber{
                                                                        calculatorResult = "7"
                                                                        isResetNumber = false
                                                                    }else if calculatorResult != "" {
                                                                        if calculatorResult.count < maxCalculatorChara{
                                                                            calculatorOperator = "7"
                                                                            calculatorResult = giveSeparatorNumDot(num: calculatorResult.split(separator: ",").joined())
                                                                        }
                                                                        
                                                                    }
                                                                }label: {
                                                                    Image("7")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(width: geo.size.width / 7)
                                                                }
                                                                
                                                                Button{
                                                                    if calculatorResult == "" || isResetNumber{
                                                                        calculatorResult = "8"
                                                                        isResetNumber = false
                                                                    }else if calculatorResult != "" {
                                                                        if calculatorResult.count < maxCalculatorChara{
                                                                            calculatorResult += "8"
                                                                            calculatorResult = giveSeparatorNumDot(num: calculatorResult.split(separator: ",").joined())
                                                                        }
                                                                        
                                                                    }
                                                                }label: {
                                                                    Image("8")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(width: geo.size.width / 7)
                                                                }
                                                                
                                                                Button{
                                                                    if calculatorResult == "" || isResetNumber{
                                                                        calculatorResult = "9"
                                                                        isResetNumber = false
                                                                    }else if calculatorResult != "" {
                                                                        if calculatorResult.count < maxCalculatorChara{
                                                                            calculatorResult += "9"
                                                                            calculatorResult = giveSeparatorNumDot(num: calculatorResult.split(separator: ",").joined())
                                                                        }
                                                                        
                                                                    }
                                                                }label: {
                                                                    Image("9")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(width: geo.size.width / 7)
                                                                }
                                                                
                                                                Button{
                                                                    if calculatorResult != "" {
                                                                        if isResetNumber == false{
                                                                            calculate()
                                                                        }
                                                                        calculatorOperator = "+"
                                                                        isResetNumber = true
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
                                                                    if calculatorResult == "" || isResetNumber{
                                                                        calculatorResult = "0"
                                                                        isResetNumber = false
                                                                    }else if calculatorResult != "" && calculatorResult != "0" {
                                                                        if calculatorResult.count < maxCalculatorChara{
                                                                            calculatorResult += "0"
                                                                            calculatorResult = giveSeparatorNumDot(num: calculatorResult.split(separator: ",").joined())
                                                                        }
                                                                    }else{
                                                                        
                                                                    }
                                                                }label: {
                                                                    Image("0")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(width: geo.size.width / 3.5)
                                                                }
                                                                
                                                                Button{
                                                                    if calculatorResult != "" || isResetNumber == false{
                                                                        giveComma()
                                                                    }
                                                                }label: {
                                                                    Image("koma")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                        .frame(width: geo.size.width / 7)
                                                                        .padding(.horizontal, 5)
                                                                }
                                                                
                                                                Button{
                                                                    if calculatorResult != ""{
                                                                        if isResetNumber == false{
                                                                            calculate()
                                                                        }
                                                                        isResetNumber = true
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
                                            )
                                            .padding(.top, geoTop.size.height / 7)
                                            .padding(.leading, geoTop.size.width / 3.6)
                                        
                                        Spacer()
                                    }
                                    
                                    // pilih form
                                    VStack{
                                        Image("form-pilih-spt")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geoTop.size.width / 2.55, height: geoTop.size.height * 1.3)
                                            .overlay(
                                                VStack{
                                                    Button{
                                                        // wrong
                                                        withAnimation {
                                                            show1770Warning = true
                                                        }
                                                    }label: {
                                                        Image("pilihan-1770")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(height: geoTop.size.height / 3.4)
                                                    }
                                                    .fullScreenCover(isPresented: $show1770Warning) {
                                                        WarningSTPView(isWrong: $show1770Warning, wrongText: "1770")
                                                    }
                                                    .transition(.opacity)
                                                    
                                                    Button{
                                                        // correct
                                                        withAnimation{
                                                            page = "visualNovel8"
                                                        }
                                                    }label: {
                                                        Image("pilihan-1770s")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(height: geoTop.size.height / 3.4)
                                                    }
                                                    
                                                    Button{
                                                        // wrong
                                                        show1770ssWarning = true
                                                    }label: {
                                                        Image("pilihan-1770ss")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(height: geoTop.size.height / 3.4)
                                                    }
                                                    .fullScreenCover(isPresented: $show1770ssWarning) {
                                                        WarningSTPView(isWrong: $show1770ssWarning, wrongText: "1770ss")
                                                    }
                                                    .transition(.opacity)
                                                }
                                            )
                                            .padding(.top, geoTop.size.height / 30)
                                    }
                                    .padding(.leading, geoTop.size.width / 1.83)
                                    .padding(.top, geoTop.size.height / 10)
                                }
                                
                            }
                            
                            GeometryReader{ geoBot in
                                VStack{
                                    // guide text
                                    HStack{
                                        Image("bayu-pilih-form")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geoBot.size.width / 7, height: geoBot.size.height / 2)
                                            .padding(.leading, geoBot.size.width / 50)
                                        
                                        Image("text-guide-pilih-form")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geoBot.size.width / 1.58, height: geoBot.size.height / 3)
                                            .overlay(
                                                Text("Yuk bantu Bayu memilih form laporan SPT (Surat Pemberitahuan Tahunan) berdasarkan perhitungan penghasilannya tahun ini menggunakan kalkulator di atas ya. Pendapatan Bayu sendiri per bulannya adalah Rp 8.238.080.")
                                                    .font(.system(size: geoBot.size.width / 65, design: .rounded))
                                                    .foregroundColor(Color("Dark Brown"))
                                                    .bold()
                                                    .padding(.horizontal, geoBot.size.width / 18)
                                                    .padding(.bottom, geoBot.size.height / 25)
                                            )
                                            .padding(.top, geoBot.size.height / 6)
                                            .padding(.trailing, geoBot.size.width)
                                    }
                                }
                                .padding(.top, geoBot.size.height / 3.5)
                                .padding(.leading, geoBot.size.width / 13)
                            }
                        }
                        .padding(.top, geoScreen.size.height / 15)
                    }
					.overlay {
						if showHint {
							HintLayout(showHint: $showHint, page: page)
								.offset(x: geoScreen.size.width / 1.95, y: geoScreen.size.height / 16.3)
								.transition(.opacity)
						}
					}
            }
			
        }
        .ignoresSafeArea()
        }
}

struct ChooseFormView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseFormView(page: .constant("pilihFormSPT"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
