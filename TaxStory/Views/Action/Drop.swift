//
//  Drop.swift
//  TaxStory
//
//  Created by Alex Lim on 28/06/23.
//

import SwiftUI

struct DropView: View {
    
    @ObservedObject var vm : AnswerViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing:12) {
                
                ForEach($vm.rows, id: \.self) { $row in
                    
                    HStack(spacing:10) {
                        
                        ForEach($row) { $item in
                            Image(item.value)
                                .renderingMode( item.isShowing ? .none : .template)
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: geometry.size.width / 12.7, height: geometry.size.height / 15.7)
                                .padding(.vertical,5)
                                .padding(.horizontal,item.padding)
                                .opacity(item.isShowing ? 1 : 0)
                                .background {
                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                                        .fill(item.isShowing ? .clear : .gray.opacity(0.25))
                                    
                                }
                                .background {
                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                                        .stroke(.gray)
                                        .opacity(item.isShowing ? 1 : 0)
                                }
                                .onDrop(of: [.url], isTargeted: .constant(true)) { provider in
                                    if let first = provider.first {
                                        let _ = first.loadObject(ofClass: URL.self) { value,error in
                                            guard let url = value else { return }
                                            if item.id  == "\(url)" {
                                                DispatchQueue.main.async {
                                                    vm.droppedCount += 1
                                                    let progress = (vm.droppedCount / CGFloat(vm.characters.count))
                                                    withAnimation {
                                                        
                                                        item.isShowing = true
                                                        vm.updateSuffledArray(character: item)
                                                        vm.progress = progress
                                                    }
                                                    
                                                    item.isShowing = true
                                                }
                                                
                                            }else {
                                                animationView()
                                            }
                                        }
                                    }
                                    return false
                                }
                                .offset(x: item.offsiteX, y: item.offsiteY)
                        }
                    }
                    if  vm.rows.last != row {
                        Divider()
                    }
                }
            }
        }
    }
    
    func animationView() {
        withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.2)) {
            vm.animateWrongText = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.2)) {
                vm.animateWrongText = false
            }
        }
    }
}

struct DropView_Previews: PreviewProvider {
    static var previews: some View {
        DropView(vm: AnswerViewModel())
    }
}
