//
//  WarningMapModal.swift
//  TaxStory
//
//  Created by Timothy on 11/07/23.
//

import SwiftUI

struct WarningMapModal: View {
	@Binding var showMapModal: Bool
	@Binding var page: String
	
	var body: some View {
		ZStack {
			Color.black
				.opacity(0.1)
			
			Image("ModalMap")
				.resizable()
				.scaledToFit()
				.overlay {
					GeometryReader { geo in
						HStack {
							Spacer()
							
							Button {
								// close modal
								withAnimation {
									showMapModal = false
								}
							} label: {
								Image("Batal")
									.resizable()
									.scaledToFit()
									.frame(width: geo.size.width / 3.7)
							}
							.offset(y: geo.size.height / 1.34)
							
							Spacer()
							
							Button {
								// close modal
								withAnimation {
									page = "mapCase"
								}
								showMapModal = false
							} label: {
								Image("Ya")
									.resizable()
									.scaledToFit()
									.frame(width: geo.size.width / 3.7)
							}
							.offset(y: geo.size.height / 1.34)
							
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

struct WarningMapModal_Previews: PreviewProvider {
    static var previews: some View {
		WarningMapModal(showMapModal: .constant(true), page: .constant(""))
			.previewInterfaceOrientation(.landscapeRight)
    }
}
