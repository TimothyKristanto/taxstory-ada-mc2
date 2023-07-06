//
//  FillForm.swift
//  TaxStory
//
//  Created by Alex Lim on 27/06/23.
//

import SwiftUI

struct FillForm: View {
    @StateObject var vm : AnswerViewModel
    @State private var currentImageIndex = 0
    @State private var selectedButton = 1
    @State var dragAmount = CGSize.zero
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("formSPTdanBuktiPotong-10")
                    .resizable()
                    .scaledToFill()
                
                // task list
                VStack{
                    HStack{
                        VStack {
                            Image("Quest")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width / 6.5)
                        }
                        .overlay(
                            VStack {
                                Text("Quest")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.top, geometry.size.height / 110)
                                
                                Spacer()
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                        Text("Pilih form")
                                            .font(.title2)
                                    }
                                    
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                        Text("Minta bukti potong")
                                            .font(.title2)
                                    }
                                    
                                    HStack {
                                        Image(systemName: "circle.fill")
                                        Text("Isi formulir")
                                            .font(.title2)
                                    }
                                    
                                    HStack {
                                        Image(systemName: "circle")
                                        Text("PTKP")
                                            .font(.title2)
                                    }
                                    
                                    HStack {
                                        Image(systemName: "circle")
                                        Text("Result")
                                            .font(.title2)
                                    }
                                }
                                .padding(.horizontal, geometry.size.width / 55)
                                .padding(.top, geometry.size.height / 40)
                                
                                Spacer()
                            }
                        )
                        .padding(.leading, geometry.size.width / 18)
                        .padding(.top, geometry.size.height / 12)
                        Spacer()
                    }
                    Spacer()
                }
            }
                    
                    // SPTForm
                        VStack {
                                VStack{
                                    Image("formSPTdanBuktiPotong-07")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geometry.size.width / 3.6)
                                        .padding(.leading, geometry.size.width / 4.2)
                                        .padding(.top, geometry.size.height / 13)
                                }
                            Spacer()
                        }
            
                    //DataBuktiPotong
            VStack {
                ZStack {
                    Image(selectedImageName())
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width / 2.1)
                        .padding(.leading, geometry.size.width / 2.2)
                        .offset(y: geometry.size.height / 65)
                    VStack() {
                        VStack() {
                            Drop(vm: vm)
                                .offset(x: geometry.size.height / 2.13)
                                .offset(y: geometry.size.height / 3.21)
                            Drag(vm: vm, pageForm: $selectedButton)
                                .offset(x: geometry.size.height / 1.12)
                                .offset(y: -geometry.size.height / 6.7)

                        }
                        Spacer()
                    
                    }
                    
                    if selectedButton == 1 {                     Button(action: {
                        selectedButton = 1
                    })
                        {
                        Text("")
                            .frame(width: 50, height: 100)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())
                    }
                    .offset(x: geometry.size.height / 1.75)
                    .offset(y: -geometry.size.height / 3.95)
                    Button(action: {
                        selectedButton = 2
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())
                    }
                        .offset(x: geometry.size.height / 1.76)
                        .offset(y: -geometry.size.height / 5.85)
                    Button(action: {
                        selectedButton = 3
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.76)
                        .offset(y: -geometry.size.height / 9.1)
                    Button(action: {
                        selectedButton = 4
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.76)
                        .offset(y: -geometry.size.height / 20.3)
                    Button(action: {
                        selectedButton = 5
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.76)
                        .offset(y: geometry.size.height / 94.7)
                        
                    }
                    else if selectedButton == 2 {                     Button(action: {
                        selectedButton = 1
                    })
                        {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())
                    }
                    .offset(x: geometry.size.height / 1.77)
                    .offset(y: -geometry.size.height / 3.65)
                    Button(action: {
                        selectedButton = 2
                    }) {
                        Text("")
                            .frame(width: 50, height: 100)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())
                    }
                        .offset(x: geometry.size.height / 1.75)
                        .offset(y: -geometry.size.height / 5.18)
                    Button(action: {
                        selectedButton = 3
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.76)
                        .offset(y: -geometry.size.height / 9.1)
                    Button(action: {
                        selectedButton = 4
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.76)
                        .offset(y: -geometry.size.height / 20.3)
                    Button(action: {
                        selectedButton = 5
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.76)
                        .offset(y: geometry.size.height / 94.7)
                        
                    }
                    else if selectedButton == 3 {                     Button(action: {
                        selectedButton = 1
                    })
                        {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())
                    }
                    .offset(x: geometry.size.height / 1.77)
                    .offset(y: -geometry.size.height / 3.65)
                    Button(action: {
                        selectedButton = 2
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())
                    }
                        .offset(x: geometry.size.height / 1.765)
                        .offset(y: -geometry.size.height / 4.69)
                    Button(action: {
                        selectedButton = 3
                    }) {
                        Text("")
                            .frame(width: 50, height: 100)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.74)
                        .offset(y: -geometry.size.height / 7.6)
                    Button(action: {
                        selectedButton = 4
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.76)
                        .offset(y: -geometry.size.height / 20.3)
                    Button(action: {
                        selectedButton = 5
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.76)
                        .offset(y: geometry.size.height / 94.7)
                        
                    }
                    else if selectedButton == 4 {                     Button(action: {
                        selectedButton = 1
                    })
                        {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())
                    }
                    .offset(x: geometry.size.height / 1.77)
                    .offset(y: -geometry.size.height / 3.65)
                    Button(action: {
                        selectedButton = 2
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())
                    }
                        .offset(x: geometry.size.height / 1.765)
                        .offset(y: -geometry.size.height / 4.69)
                    Button(action: {
                        selectedButton = 3
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.765)
                        .offset(y: -geometry.size.height / 6.54)
                    Button(action: {
                        selectedButton = 4
                    }) {
                        Text("")
                            .frame(width: 50, height: 100)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.76)
                        .offset(y: -geometry.size.height / 13.65)
                    Button(action: {
                        selectedButton = 5
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.768)
                        .offset(y: geometry.size.height / 109.7)
                        
                    }
                    else {
                        Button(action: {
                        selectedButton = 1
                    })
                        {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())
                    }
                    .offset(x: geometry.size.height / 1.77)
                    .offset(y: -geometry.size.height / 3.65)
                    Button(action: {
                        selectedButton = 2
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())
                    }
                        .offset(x: geometry.size.height / 1.765)
                        .offset(y: -geometry.size.height / 4.69)
                    Button(action: {
                        selectedButton = 3
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.765)
                        .offset(y: -geometry.size.height / 6.54)
                    Button(action: {
                        selectedButton = 4
                    }) {
                        Text("")
                            .frame(width: 30, height: 60)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.765)
                        .offset(y: -geometry.size.height / 10.85)
                    Button(action: {
                        selectedButton = 5
                    }) {
                        Text("")
                            .frame(width: 50, height: 100)
                            .foregroundColor(Color.black)
//                            .background(Color.red)
                            .clipShape(Rectangle())

                    }
                        .offset(x: geometry.size.height / 1.758)
                        .offset(y: -geometry.size.height / 75.7)
                        
                    }
 
                }
                .padding()
                .onAppear {
                    vm.shuffleArray()
                }
                .offset(x: vm.animateWrongText ? -30 : 0)
                .environmentObject(vm)
            }
                    VStack {
                        // guide text
                        Spacer()
                        HStack {
                            Image("bayu-pilih-form")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width / 7)
                                .offset(y: -geometry.size.height / 35.85)
                                .offset(x: geometry.size.height / 25.55)
                            Image("formSPTdanBuktiPotong-08")
                                .resizable()
                                .scaledToFit()
                                .padding(.top, geometry.size.height / 30)
                                .offset(y: -geometry.size.height / 1000.85)
                                .offset(x: geometry.size.height / 200.55)
                                .frame(width: geometry.size.width / 2.61)
                                .overlay(
                                    Text("Nanti je dah atur belum tak atur ")
                                        .font(.title2)
                                        .bold()
                                        .offset(y: -geometry.size.height / 1000.85)
                                        .offset(x: geometry.size.height / 200.55)
                            )
                        }
                    }
                    .padding(.bottom, geometry.size.height / 12.2)
                    .padding(.trailing, geometry.size.width / 1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                
            }
            .ignoresSafeArea()
        }
    
    // Function to determine the image name based on the selected button
    private func selectedImageName() -> String {
        switch selectedButton {
        case 1:
            return "BuktiPotong1"
        case 2:
            return "BuktiPotong2"
        case 3:
            return "BuktiPotong3"
        case 4:
            return "BuktiPotong4"
        case 5:
            return "BuktiPotong5a"
        default:
            return ""
        }
    }
    
}

struct FillForm_Previews: PreviewProvider {
    static var previews: some View {
        FillForm(vm: AnswerViewModel())
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

