//
//  HintLayout.swift
//  TaxStory
//
//  Created by Timothy on 12/07/23.
//

import SwiftUI

struct HintLayout: View {
	@Binding var showHint: Bool
	var page: String
	
    var body: some View {
		GeometryReader { geo in
			VStack {
				Image(page == "pilihFormSPT" ? "hintCalcu" : page == "mintaBuktiPotong" ? "hintMintaBuktiPotong" : page == "isiBuktiPotong" ? "hintFormBuktiPotong" : page == "laporHarta" ? "hintLaporHarta" : page == "pilihPTKP" ? "hintPTKP" : "")
					.resizable()
					.scaledToFit()
					.frame(width: geo.size.width / 2.6)
					.overlay {
						Button {
							withAnimation {
								showHint = false
							}
						}label: {
							Image("Close")
								.resizable()
								.scaledToFit()
								.frame(width: geo.size.width / 32)
						}
						.offset(x: geo.size.width / 7.6, y: -geo.size.height / 14.5)
					}
			}
		}
    }
}

struct HintLayout_Previews: PreviewProvider {
    static var previews: some View {
		HintLayout(showHint: .constant(true), page: "hintCalcu")
			.previewInterfaceOrientation(.landscapeRight)
    }
}
