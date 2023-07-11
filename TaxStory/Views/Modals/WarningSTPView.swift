//
//  WarningSTPView.swift
//  TaxStory
//
//  Created by Timothy on 11/07/23.
//

import SwiftUI

struct WarningSTPView: View {
    @Binding var isWrong: Bool
    var wrongText: String
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.1)
            
            Image(wrongText == "1770" ? "warning1770" : "warning1770ss")
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

struct WarningSTPView_Previews: PreviewProvider {
    static var previews: some View {
        WarningSTPView(isWrong: .constant(true), wrongText: "1770ss")
            .previewInterfaceOrientation(.landscapeRight)
    }
}
