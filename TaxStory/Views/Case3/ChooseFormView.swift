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
    
    let maxCalculatorChara = 11
    
    func changeCalculatorResultToScientific(){
        if calculatorResult.count > 10 {
             let numberFormatter = NumberFormatter()
             numberFormatter.numberStyle = .scientific
            calculatorResult = numberFormatter.string(from: Double(calculatorResult.split(separator: ",").joined())! as NSNumber)!
        }
    }
    
    func giveSeparatorNumDot(num: String)->String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 2
        let formattedNum = formatter.string(from: Double(num)! as NSNumber) ?? ""
        return formattedNum
    }
    
    func containDecimal(num: Double)->Bool{
        if num - floor(num) > 0{
            return true
        }
        
        return false
    }
    
    func giveComma(){
        if calculatorResult.contains(".") == false && calculatorResult != "0"{
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
        VStack{
            Image("bg-pilih-form")
                .resizable()
                .scaledToFill()
                .overlay {
                    HStack{
                        // task list
                        VStack{
                            VStack{
                                Image("quest")
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
                                            Image(systemName: "circle")
                                            
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
                        
                        // calculator
                        VStack{
                            Image("calculatorbody")
                                .resizable()
                                .scaledToFit()
                                .frame(height: Constants.screenHeight / 1.6)
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
                                                        if calculatorResult != "" {
                                                            if calculatorResult.count < maxCalculatorChara{
                                                                calculatorResult += "0"
                                                                calculatorResult = giveSeparatorNumDot(num: calculatorResult.split(separator: ",").joined())
                                                            }
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
                                .padding(.top, Constants.screenHeight / 13.5)
                            
                            Spacer()
                        }
                        
                        // pilih form
                        VStack{
                            VStack{
                                
                            }
                            
                            
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
                                Text("Yuk bantu Bayu memilih form laporan SPT (Surat Pemberitahuan Tahunan) berdasarkan perhitungan penghasilannya tahun ini menggunakan kalkulator di atas ya. Pendapatan Bayu per bulannya sendiri adalah Rp 4.500.000.  ")
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

struct ChooseFormView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseFormView()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
