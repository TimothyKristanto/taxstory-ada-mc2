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
                                        Text("Lapor Harta")
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
                    Image("BuktiPotong1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width / 2.1)
                        .padding(.leading, geometry.size.width / 2.2)
                        .offset(y: geometry.size.height / 65)
                    VStack() {
                        VStack() {
                            DropView(vm: vm)
                                .offset(x: geometry.size.height / 2.13)
                                .offset(y: geometry.size.height / 3.21)
                            Drag(vm: vm)
                                .offset(x: geometry.size.height / 1.12)
                                .offset(y: -geometry.size.height / 6.7)

                        }
                        Spacer()
                    }
                    .padding()
                    .onAppear {
                        vm.shuffleArray()
                    }
                    .offset(x: vm.animateWrongText ? -30 : 0)
                    .environmentObject(vm)
                }
//                    if let image = UIImage(named: "page1puzzle2") {
//                        Image(uiImage: image)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: geometry.size.width / 12)
//                            .padding(.leading, geometry.size.width / 1.65)
//                            .padding(.top, geometry.size.height / 8)
//                            .offset(y: -geometry.size.height / 1.815)
//                            .onDrag {
//                                return NSItemProvider(object: image)
//                            }
//                    }
//                    Image("page1puzzle2")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: geometry.size.width / 12)
//                        .padding(.leading, geometry.size.width / 1.65)
//                        .padding(.top, geometry.size.height / 8)
//                        .offset(y: -geometry.size.height / 1.815)
                    
                    
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
    }

struct FillForm_Previews: PreviewProvider {
    static var previews: some View {
        FillForm(vm: AnswerViewModel())
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

//struct DTDropTarget: DropDelegate {
//    @Binding var text: String
//    @Binding var dropTargetText: String
//
//    func performDrop(info: DropInfo) -> Bool {
//        text = ""
//        dropTargetText = "DevTechie"
//        return true
//    }
//}
//
//struct DragDropExample: View {
//    @State private var text = "DevTechie"
//    @State private var dropTargetText = ""
//    var body: some View {
//        VStack {
//            Text(text)
//                .font(.largeTitle)
//                .onDrag({
//                    NSItemProvider(object: self.text as NSString)
//                })
//
//            RoundedRectangle(cornerRadius: 20)
//                .fill(.orange)
//                .frame(width: 200, height: 100)
//                .overlay(Text(dropTargetText))
//                .onDrop(of: [text], delegate: DTDropTarget(text: $text, dropTargetText: $dropTargetText))
//        }
//
//    }
//}
