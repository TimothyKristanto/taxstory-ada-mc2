//
//  WarningPTKPView.swift
//  TaxStory
//
//  Created by Timothy on 10/07/23.
//

import SwiftUI

struct WarningPTKPView: View {
    @Binding var isWrong: Bool
    @Binding var wrongText: String
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.1)
            
            Image(wrongText == "tk1" ? "warningTK1" : "warningK0")
                .resizable()
                .scaledToFit()
                .overlay {
                    GeometryReader { geo in
                        HStack {
                            Spacer()
                            
                            Button {
                                // close modal
                                isWrong = false
                            } label: {
                                Image("cobaLagi")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width / 3.7)
                            }
                            .offset(y: geo.size.height / 1.38)
                            
                            Spacer()
                        }
                    }
                }
                .frame(width: Constants.screenWidth / 1.5)
        }
        .background(BackgroundBlurLayout())
        .ignoresSafeArea()
    }
}

struct WarningPTKPView_Previews: PreviewProvider {
    static var previews: some View {
        WarningPTKPView(isWrong: .constant(true), wrongText: .constant("tk1"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
