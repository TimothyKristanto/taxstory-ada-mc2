
//
//  VisualNovel.swift
//  TaxStory
//
//  Created by Alex Lim on 10/07/23.
//

import SwiftUI

struct NotDoneVisualNovel: View {
    @State var emotions: [Emotion] = []
    @ObservedObject var dates = ReadData()
    @State private var currentEmotionIndex = 0
    
    var body: some View {
//        let emotion = emotions[currentEmotionIndex]
        ZStack{
            GeometryReader{ geoScreen in
                VStack{
                    Image("backgroundNovel")
                        .resizable()
                        .frame(width: geoScreen.size.width / 1, height: geoScreen.size.height / 0.95)
                        .padding(.top, -geoScreen.size.height / 40)
                        .scaledToFill()
                        .overlay{
                            VStack{
                                HStack{
                                    Button{
                                        // munculin dialog, trus balik ke main map
                                    }label: {
                                        Image("Map")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                    .frame(width: geoScreen.size.width / 13)
                                    
                                    Spacer()
                                }
                                .padding(.leading, geoScreen.size.width / 28)
                                .padding(.trailing, geoScreen.size.width / 10)
                                .padding(.top, geoScreen.size.height / 100)
                                
                                Spacer()
                            }
                        }
                }
                //            .offset(x: geoScreen.size.height / 1)
                //            .offset(y: -geoScreen.size.height / 6)
                GeometryReader{ geoBot in
                    let emotion = dates.emotions[currentEmotionIndex]
                    VStack{
                        // guide text
                        HStack{
                            Image(emotion.pictureName ?? "")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geoBot.size.width / 1, height: geoBot.size.height / 1.2)
                            //                                .offset(x: -geoBot.size.height / 1.75)
                                .offset(y: geoScreen.size.height / 10)
                        }
                    }
                    VStack{
                        HStack{
                            Image("textBox")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geoBot.size.width / 1.2, height: geoBot.size.height / 2)
                                .overlay(
                                    Text(emotion.textBox)
                                        .font(.system(size: geoBot.size.width / 65, design: .rounded))
                                        .bold()
                                        .padding(.horizontal, geoBot.size.width / 18)
                                        .padding(.top, geoBot.size.height / 100)
                                )
                            
                                .overlay{
                                    VStack
                                    {
                                        // Building image
                                        Button(action:
                                                {
                                            currentEmotionIndex += 1
                                        })
                                        {Image("NextButton")
                                                .resizable()
                                                .renderingMode(.original)
                                                .aspectRatio(contentMode: .fit)
                                                .scaledToFit()
                                                .frame(width: geoBot.size.width/20)
                                            
                                        }
                                        .offset(y: geoBot.size.height / 20)
                                        .offset(x: geoBot.size.height / 1.95)
                                    }
                                }
                            
                        }
                        .padding(.top, geoBot.size.height / 1.8)
                        .padding(.leading, geoBot.size.width / 12)
                    }
                    
                    
                    
                    //        List(dates.emotions)
                    //        { emotion in
                    //            VStack(alignment: .leading) {
                    //
                    //                Text(emotion.pictureName ?? "")
                    //                    .font(.title)
                    //                    .fontWeight(.heavy)
                    //                    .foregroundColor(Color.gray)
                    //
                    //                HStack{
                    //                    Text(emotion.textBox)
                    //                        .font(.title3)
                    //                        .foregroundColor(Color.red)
                    //                }
                    //            }
                    //        }
                    
                    //            ini jadi simpan
                    //                                let emotion = dates.emotions[0]
                    //                                VStack(alignment: .leading)
                    //                                {
                    //                                    Text(emotion.pictureName ?? "")
                    //                                        .font(.title)
                    //                                        .fontWeight(.heavy)
                    //                                        .foregroundColor(Color.gray)
                    //
                    //                                    HStack{
                    //                                        Text(emotion.textBox)
                    //                                            .font(.title3)
                    //                                            .foregroundColor(Color.red)
                    //
                    //                                    }
                    //                                }
                }
            }
        }
    }
        
}

struct NotDoneVisualNovel_Previews: PreviewProvider {
    static var previews: some View {
        NotDoneVisualNovel()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
