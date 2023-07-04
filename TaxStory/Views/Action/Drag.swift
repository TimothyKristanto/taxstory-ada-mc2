//
//  Drag.swift
//  TaxStory
//
//  Created by Alex Lim on 29/06/23.
//

import SwiftUI

struct Drag: View {
    
    @ObservedObject var vm : AnswerViewModel
   
    var body: some View {
        GeometryReader { geometry in
            VStack() {
                //!! Jadi permasalahan utama from these code: if select other the first picture got selected and u need to check for the randomizer from 3 image.
                Text("\(vm.characters[0].value)")
                    .frame(width: geometry.size.width / 12) //(size ganti)aaaaaaaa
//                    .padding(.leading, geometry.size.height / 19)
                    .padding(.trailing, geometry.size.height / 9)
                    .background {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
//                            .stroke(.brown)
                            .fill(Color("LightBrown"))
                    }
                    .onDrag {
                        return .init(contentsOf:URL(string:vm.characters[0].id))!
                    }
                    .offset(x: -geometry.size.height / 45.13)
                    .offset(y: geometry.size.height / 100.21)
                    

                    .opacity(vm.characters[0].isShowing ? 0 : 1)
                    .background {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .stroke(.brown)
                            .opacity(vm.characters[0].isShowing ? 1 : 0)
                    }

                Text("\(vm.characters[1].value)")
                    .frame(width: geometry.size.width / 12) //(size ganti)aaaaaaaa
//                    .padding(.top, geometry.size.height / 22)
                    .background {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
//                            .stroke(.brown)
                            .fill(Color("LightBrown"))
                    }
                    .onDrag {
                        return .init(contentsOf:URL(string:vm.characters[1].id))!
                    }
                    .offset(x: -geometry.size.height / 7.4)
                    .offset(y: geometry.size.height / 11.21)

                    .opacity(vm.characters[1].isShowing ? 0 : 1)
                    .background {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .stroke(.brown)
                            .opacity(vm.characters[1].isShowing ? 1 : 0)
                    }

                Text("\(vm.characters[2].value)")
                    .frame(width: geometry.size.width / 12)
//                    .padding(.leading, geometry.size.height / 10)
                    .padding(.trailing, geometry.size.height / 5.8)//(size ganti)aaaaaaaa
//                    .padding(.top, geometry.size.height / 2200)
                    .background {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
//                            .stroke(.brown)
                            .fill(Color("LightBrown"))

                    }
                    .onDrag {
                        return .init(contentsOf:URL(string:vm.characters[2].id))!
                    }
                    .offset(x: -geometry.size.height / 22.13)
                    .offset(y: geometry.size.height / 10.21)
                    .opacity(vm.characters[2].isShowing ? 0 : 1)
                    .background {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .stroke(.gray)

                            .opacity(vm.characters[2].isShowing ? 1 : 0)
                    }
                
//                //yang ini bagian klo jadi list gambarnya
//                ForEach($vm.shuffledRows, id: \.self) { $row in
//                    HStack() {
//                        ForEach($row) { $item in
//                            Image(item.value)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: geometry.size.width / 12) //(size ganti)aaaaaaaa
////                                .padding(.leading, geometry.size.width / 22)
//                                .padding(.top, geometry.size.height / 2200)
//                            //                            .padding(.vertical,5)
//                            //                            .padding(.horizontal,item.padding)
//                                .background {
//                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
//                                        .stroke(.gray)
//
//                                }
//                                .onDrag {
//                                    return .init(contentsOf:URL(string:item.id))!
//                                }
//
//                                .opacity(item.isShowing ? 0 : 1)
//                                .background {
//                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
//                                        .stroke(.gray)
//                                        .opacity(item.isShowing ? 1 : 0)
//                                }
////                                .offset(y: -geometry.size.height / 90)
////                                .offset(x: geometry.size.height / 2.55)
////                                .offset(y: -geometry.size.height / 1)aaaaaaaa
//                        }
//                    }
//                    if vm.shuffledRows.last != row {
//                        Divider()
                    }
                }
            }
        }
//    }
//}

struct Drag_Previews: PreviewProvider {
    static var previews: some View {
        Drag(vm: AnswerViewModel())
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
