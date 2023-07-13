//
//  GlosariumModal.swift
//  TaxStory
//
//  Created by Timothy on 13/07/23.
//

import SwiftUI

struct GlosariumModal: View {
	@State var dictionaryPage = 1
	@Binding var showGlosarium: Bool
	
    var body: some View {
        Image("dictionary0\(dictionaryPage)")
			.resizable()
			.scaledToFill()
			.padding()
			.overlay {
				GeometryReader { geo in
					VStack {
						Spacer()
						
						HStack {
							if dictionaryPage == 1 {
								Spacer()
								
								Button {
									dictionaryPage = 2
								} label: {
									Image("NextButton")
										.resizable()
										.scaledToFit()
										.frame(width: geo.size.width / 11)
								}
								.offset(x: -geo.size.width / 30, y: -geo.size.height / 25)
							} else if dictionaryPage == 2 {
								Button {
									dictionaryPage = 1
								} label: {
									Image("BackButton")
										.resizable()
										.scaledToFit()
										.frame(width: geo.size.width / 11)
								}
								.offset(x: geo.size.width / 30, y: -geo.size.height / 20)
								
								Spacer()
							}
						}
					}
				}
			}
			.overlay {
				GeometryReader { geo in
					HStack {
						Spacer()
						
						Button {
							showGlosarium = false
						} label: {
							Image("Close")
								.resizable()
								.scaledToFit()
								.frame(width: geo.size.width / 20)
						}
						.offset(x: -geo.size.width / 25, y: geo.size.height / 20)
					}
				}
			}
			.ignoresSafeArea()
    }
}

struct GlosariumModal_Previews: PreviewProvider {
    static var previews: some View {
		GlosariumModal(showGlosarium: .constant(true))
			.previewInterfaceOrientation(.landscapeRight)
    }
}
