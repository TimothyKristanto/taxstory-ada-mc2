
//
//  VisualNovel.swift
//  TaxStory
//
//  Created by Alex Lim on 10/07/23.
//

import SwiftUI

struct VisualNovel: View {
    @State var emotions: [Emotion] = []
    @ObservedObject var datas = ReadData()
    var body: some View {
        List(datas.emotions){ emotion in
            
            VStack(alignment: .leading) {
    
                Text(emotion.pictureName ?? "")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.gray)
                
                HStack{
                    Text(emotion.textBox)
                        .font(.title3)
                        .foregroundColor(Color.red)
                }
            }
        }
    }
}

struct VisualNovel_Previews: PreviewProvider {
    static var previews: some View {
        VisualNovel()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
