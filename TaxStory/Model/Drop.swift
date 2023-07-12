//
//  Drop.swift
//  TaxStory
//
//  Created by Alex Lim on 28/06/23.
//

import SwiftUI

struct Drop : View {
    @ObservedObject var ViewModel : AnswerViewModel
	@Binding var page: String
    
    var body : some View {
        GeometryReader { geometry in
            VStack(spacing:12)
            {
                //Designing the drop destination
                ForEach($ViewModel.rows, id: \.self) { $row in
                    HStack(spacing:10)
                    {
                        ForEach($row) { $item in
                            Text(item.value)
                                .foregroundColor(.brown)
                                .frame(width: geometry.size.width / 10.6, height: geometry.size.height / 40)
                                .padding(.vertical,5)
                                .padding(.horizontal,item.padding)
                                .opacity(item.isShowing ? 1 : 0)
                                .background
                            {
                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                    .fill(item.isShowing ? .clear : .brown.opacity(0.25))
                            }
                                .background
                            {
                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                    .stroke(.brown)
                                    .opacity(item.isShowing ? 1 : 0)
                            }
                                .onDrop(of: [.url], isTargeted: .constant(true))
                            { provider in
                                    if let first = provider.first
                                {
                                        let _ = first.loadObject(ofClass: URL.self)
                                        { value,error in
                                            guard let url = value else { return }
                                            if item.id  == "\(url)"
                                            {
                                                DispatchQueue.main.async
                                                {
                                                    ViewModel.droppedCount += 1
                                                    let progress = (ViewModel.droppedCount / CGFloat(ViewModel.characters.count))
                                                    withAnimation
                                                    {
                                                        item.isShowing = true
                                                        ViewModel.checkAnswer(character: item)
                                                        ViewModel.progress = progress
                                                    }
                                                    item.isShowing = true
													
													// check if user already filled the form
													if ViewModel.droppedCount == 5 {
														// next page
														withAnimation {
															page = "laporHarta"
														}
													}
                                                }
                                            }
                                            else
                                            {
                                                animationView()
                                            }
                                        }
                                    }
                                    return false
                                }
                            //This offset take from answerviewmodel where the position is position there.
                                .offset(x: item.offsiteX, y: item.offsiteY)
                        }
                    }
                    if  ViewModel.rows.last != row
                    {
                        Divider()
                    }
                }
            }
        }
    }
    
    func animationView()
    {
        withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.2))
        {
            ViewModel.animateWrongText = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1)
        {
            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.2))
            {
                ViewModel.animateWrongText = false
            }
        }
    }
}

struct DropView_Previews: PreviewProvider
{
    static var previews: some View
    {
		Drop(ViewModel: AnswerViewModel(), page: .constant("isiBuktiPotong"))
    }
}
