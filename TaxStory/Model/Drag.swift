//
//  Drag.swift
//  TaxStory
//
//  Created by Alex Lim on 29/06/23.
//

import SwiftUI

struct Drag: View
{
    
    @ObservedObject var ViewModel : AnswerViewModel
    @Binding var pageForm: Int
   
    var body: some View
    {
        GeometryReader
        { geometry in
            VStack()
            {
                //if condition for changing asset value that can be drag according to picture form
                if pageForm == 1
                {
                    Text("\(ViewModel.characters[0].value)")
                        .frame(width: geometry.size.width / 8)
                        .background
                    {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(Color("DarkCream"))
                    }
                    .onDrag
                    {
                        return .init(contentsOf:URL(string:ViewModel.characters[0].id))!
                    }
                    .offset(x : -geometry.size.height / 18)
                    .offset(y : geometry.size.height / 100.21)
                    .opacity(ViewModel.characters[0].isShowing ? 0 : 1)
                    .background
                    {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .stroke(.brown)
                            .opacity(ViewModel.characters[0].isShowing ? 1 : 0)
                    }
                    Text("\(ViewModel.characters[1].value)")
                        .frame(width: geometry.size.width / 13)
                        .background {
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .fill(Color("DarkCream"))
                        }
                        .onDrag {
                            return .init(contentsOf:URL(string:ViewModel.characters[1].id))!
                        }
                        .offset(x: -geometry.size.height / 5.7)
                        .offset(y: geometry.size.height / 11.21)
                    
                        .opacity(ViewModel.characters[1].isShowing ? 0 : 1)
                        .background
                    {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .stroke(.brown)
                            .opacity(ViewModel.characters[1].isShowing ? 1 : 0)
                    }
                    Text("\(ViewModel.characters[2].value)")
                        .frame(width: geometry.size.width / 5.9)
                        .background
                    {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(Color("DarkCream"))
                    }
                    .onDrag
                    {
                        return .init(contentsOf:URL(string:ViewModel.characters[2].id))!
                    }
                    .offset(x: -geometry.size.height / 21.13)
                    .offset(y: geometry.size.height / 10.21)
                    .opacity(ViewModel.characters[2].isShowing ? 0 : 1)
                    .background
                    {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .stroke(.gray)
                            .opacity(ViewModel.characters[2].isShowing ? 1 : 0)
                    }
                }
                else if pageForm == 4
                {
                    Text("\(ViewModel.characters[3].value)")
                        .frame(width: geometry.size.width / 10.5)
                        .background
                    {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(Color("DarkCream"))
                    }
                    .onDrag
                    {
                        return .init(contentsOf:URL(string:ViewModel.characters[3].id))!
                    }
                    .offset(x: geometry.size.height / 3.45)
                    .offset(y: geometry.size.height / 1.615)
                    .opacity(ViewModel.characters[3].isShowing ? 0 : 1)
                    .background
                    {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .stroke(.brown)
                            .opacity(ViewModel.characters[3].isShowing ? 1 : 0)
                    }
                }
                else if pageForm == 5
                {
                    Text("\(ViewModel.characters[4].value)")
                        .frame(width: geometry.size.width / 13.9)
                        .background
                    {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(Color("DarkCream"))
                    }
                    .onDrag
                    {
                        return .init(contentsOf:URL(string:ViewModel.characters[4].id))!
                    }
                    .offset(x: geometry.size.height / 10.4)
                    .offset(y: geometry.size.height / 5.38)
                    .opacity(ViewModel.characters[4].isShowing ? 0 : 1)
                    .background
                    {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .stroke(.brown)
                            .opacity(ViewModel.characters[4].isShowing ? 1 : 0)
                    }
                }
            }
        }
    }
}

struct Drag_Previews: PreviewProvider
{
    static var previews: some View
    {
        Drag(ViewModel: AnswerViewModel(), pageForm: .constant(1))
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
