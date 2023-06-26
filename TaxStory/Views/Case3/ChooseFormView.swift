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
    }
    
    var body: some View {
        VStack{
            HStack{
                // task list
                VStack{
                    Image("Quest")
                        .resizable()
                        .scaledToFit()
                        .frame(width: Constants.screenWidth / 5)
                        .overlay(
                            VStack{
                                Text("Quest")
                                    .font(.largeTitle)
                                    .bold()
                                    .padding(.bottom)
                                
                                HStack{
                                    Image(systemName: "circle.fill")
                                    
                                    Text("Pilih Form")
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
                                .padding(.top, 30)
                        )
                    
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
                                                            
                                                            if calculatorResult == ""{
                                                                Text("0")
                                                                    .font(.largeTitle)
                                                                    .bold()
                                                                    .padding(.trailing, geo.size.width / 12)
                                                                    .padding(.top)
                                                            }else{
                                                                Text(calculatorResult)
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
                                            }label: {
                                                Image("ac")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 3.5)
                                            }
                                            
                                            Button{
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        operation = "%"
                                                        
                                                        
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
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        operation = "/"
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
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        calculatorResult += "1"
                                                    }
                                                }else if calculatorResult == ""{
                                                    calculatorResult = "1"
                                                }
                                                
                                            }label: {
                                                Image("1")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        calculatorResult += "2"
                                                    }
                                                }else if calculatorResult == ""{
                                                    calculatorResult = "2"
                                                }
                                            }label: {
                                                Image("2")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        calculatorResult += "3"
                                                    }
                                                    
                                                }else if calculatorResult == ""{
                                                    calculatorResult = "3"
                                                }
                                            }label: {
                                                Image("3")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        operation = "x"
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
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        calculatorResult += "4"
                                                    }
                                                    
                                                }else if calculatorResult == ""{
                                                    calculatorResult = "4"
                                                }
                                            }label: {
                                                Image("4")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        calculatorResult += "5"
                                                    }
                                                    
                                                }else if calculatorResult == ""{
                                                    calculatorResult = "5"
                                                }
                                            }label: {
                                                Image("5")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        calculatorResult += "6"
                                                    }
                                                    
                                                }else if calculatorResult == ""{
                                                    calculatorResult = "6"
                                                }
                                            }label: {
                                                Image("6")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        operation = "-"
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
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        calculatorResult += "7"
                                                    }
                                                    
                                                }else if calculatorResult == ""{
                                                    calculatorResult = "7"
                                                }
                                            }label: {
                                                Image("7")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        calculatorResult += "8"
                                                    }
                                                    
                                                }else if calculatorResult == ""{
                                                    calculatorResult = "8"
                                                }
                                            }label: {
                                                Image("8")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        calculatorResult += "9"
                                                    }
                                                    
                                                }else if calculatorResult == ""{
                                                    calculatorResult = "9"
                                                }
                                            }label: {
                                                Image("9")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                            
                                            Button{
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        operation = "+"
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
                                                if calculatorResult != "" {
                                                    if calculatorResult.count < maxCalculatorChara{
                                                        calculatorResult += "0"
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
                                                
                                            }label: {
                                                Image("equal")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width / 7)
                                            }
                                        }
                                        
                                        Spacer()
            Image("bg-pilih-form")
                .resizable()
                .scaledToFill()
                .frame(width: Constants.screenWidth, height: Constants.screenHeight)
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
                                    .padding(.horizontal, Constants.screenWidth / 30)
                                    .padding(.top, Constants.screenHeight / 35)
                                    
                                    Spacer()
                                }
                            )
                            .padding(.leading, Constants.screenWidth / 12.5)
                            .padding(.top, Constants.screenHeight / 12.5)
                            
                            
                            Spacer()
                        }
                        
                        // calculator
                        VStack{
                            Image("calculatorbody")
                                .resizable()
                                .scaledToFit()
                                .frame(height: Constants.screenHeight / 1.5)
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
                                                                            .font(.largeTitle)
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
<<<<<<< HEAD
                    
                    Spacer()
                }
                
                Spacer()
                
                // pilih form
                VStack{
                    VStack{
                        Spacer()
                        
                        Text("Pilih Form")
                            .font(.largeTitle)
                            .bold()
=======
>>>>>>> case-3-fix
                        
                        Button{
                            
                        }label: {
                            HStack{
                                Text("1770")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text("Memiliki penghasilan dari usaha atau pekerjaan bebas.")
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(15)
                            .background(.gray)
                            .cornerRadius(20)
                            .padding(.top)
                        }
                        
                        Button{
                            
                        }label: {
                            HStack{
                                Text("1770 S")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text("Memiliki penghasilan sebagai karyawan perusahaan lebih dari/sama dengan 60 juta dalam 1 tahun.")
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(15)
                            .background(.gray)
                            .cornerRadius(20)
                            .padding(.top)
                        }
                        
                        Button{
                            
                        }label: {
                            HStack{
                                Text("1770 SS")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text("Memiliki penghasilan sebagai karyawan perusahaan kurang dari 60 juta dalam 1 tahun.")
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(15)
                            .background(.gray)
                            .cornerRadius(20)
                            .padding(.top)
                        }
                        
                        Spacer()
                    }
                    .padding(20)
                    .frame(width: Constants.screenWidth / 2.8, height: Constants.screenHeight / 1.6)
                    
                    
                    
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
                                    Text("Yuk bantu Bayu memilih form laporan SPT (Surat Pemberitahuan Tahunan) berdasarkan perhitungan penghasilannya tahun ini menggunakan kalkulator di atas ya. Pendapatan Bayu per bulannya sendiri adalah Rp 4.500.000.  ")
                                        .font(.title2)
                                        .bold()
                                        .padding(.top, Constants.screenHeight / 15)
                                        .padding(.horizontal, Constants.screenWidth / 15)
                                )
                            
                            Spacer()
                        }
                    }
                    .padding(.bottom, Constants.screenHeight / 12)
                }
                .padding(.top)
                
                Spacer()
            }
            
            VStack{
                // guide text
                Text("Yuk bantu Bayu memilih form laporan SPT (Surat Pemberitahuan Tahunan) berdasarkan perhitungan penghasilannya tahun ini menggunakan kalkulator di atas ya. Pendapatan Bayu per bulannya sendiri dalah Rp 4.500.000.")
                    .font(.title)
                    .bold() 
            }
            .padding(.top, 20)
            .padding(.bottom, 15)
            .frame(width: Constants.screenWidth)
            .background(.gray)
        }
    }
}

struct ChooseFormView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseFormView()
            .previewDevice("iPad Pro (12.9-inch) (6th geneeration)")
            .previewInterfaceOrientation(.landscapeLeft)
        
        ChooseFormView()
            .previewDevice("iPad Pro (11-inch) (4th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
