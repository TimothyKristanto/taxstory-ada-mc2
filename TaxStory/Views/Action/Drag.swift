//
//  Drag.swift
//  TaxStory
//
//  Created by Alex Lim on 29/06/23.
//

import SwiftUI

struct Drag: View {
    
    @ObservedObject var vm : AnswerViewModel
    @Binding var pageForm: Int
   
    var body: some View {
        GeometryReader { geometry in
            VStack() {
                if pageForm == 1 {
                    Text("\(vm.characters[0].value)")
                        .frame(width: geometry.size.width / 8)
                        .background {
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .fill(Color("DarkCream"))
                        }
                        .onDrag {
                            return .init(contentsOf:URL(string:vm.characters[0].id))!
                        }
                        .offset(x: -geometry.size.height / 20)
                        .offset(y: geometry.size.height / 100.21)
                        

                        .opacity(vm.characters[0].isShowing ? 0 : 1)
                        .background {
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .stroke(.brown)
                                .opacity(vm.characters[0].isShowing ? 1 : 0)
                        }

                    Text("\(vm.characters[1].value)")
                        .frame(width: geometry.size.width / 13)
                        .background {
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .fill(Color("DarkCream"))
                        }
                        .onDrag {
                            return .init(contentsOf:URL(string:vm.characters[1].id))!
                        }
                        .offset(x: -geometry.size.height / 5.8)
                        .offset(y: geometry.size.height / 11.21)

                        .opacity(vm.characters[1].isShowing ? 0 : 1)
                        .background {
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .stroke(.brown)
                                .opacity(vm.characters[1].isShowing ? 1 : 0)
                        }

                    Text("\(vm.characters[2].value)")
                        .frame(width: geometry.size.width / 5.9)
    //                    .padding(.leading, geometry.size.height / 10)
//                        .padding(.trailing, geometry.size.height / 5.8)//(size ganti)aaaaaaaa
    //                    .padding(.top, geometry.size.height / 2200)
                        .background {
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
    //                            .stroke(.brown)
                                .fill(Color("DarkCream"))

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
                }
                else if pageForm == 4 {
                    Text("\(vm.characters[3].value)")
                        .frame(width: geometry.size.width / 11)
                        .background {
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .fill(Color("DarkCream"))
                        }
                        .onDrag {
                            return .init(contentsOf:URL(string:vm.characters[3].id))!
                        }
                        .offset(x: geometry.size.height / 3.33)
                        .offset(y: geometry.size.height / 1.615)
                        

                        .opacity(vm.characters[3].isShowing ? 0 : 1)
                        .background {
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .stroke(.brown)
                                .opacity(vm.characters[3].isShowing ? 1 : 0)
                        }
                }
                else if pageForm == 5 {
                    Text("\(vm.characters[4].value)")
                        .frame(width: geometry.size.width / 13.9)
//                        .padding(.trailing, geometry.size.height / 9)
                        .background {
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
    //                            .stroke(.brown)
                                .fill(Color("DarkCream"))
                        }
                        .onDrag {
                            return .init(contentsOf:URL(string:vm.characters[4].id))!
                        }
                        .offset(x: geometry.size.height / 10)
                        .offset(y: geometry.size.height / 5.38)
                        

                        .opacity(vm.characters[4].isShowing ? 0 : 1)
                        .background {
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .stroke(.brown)
                                .opacity(vm.characters[4].isShowing ? 1 : 0)
                        }
                }
                    }
                }
            }
        }

struct Drag_Previews: PreviewProvider {
    static var previews: some View {
        Drag(vm: AnswerViewModel(), pageForm: .constant(1))
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
