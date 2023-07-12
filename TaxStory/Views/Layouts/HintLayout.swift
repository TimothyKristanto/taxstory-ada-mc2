//
//  HintLayout.swift
//  TaxStory
//
//  Created by Timothy on 12/07/23.
//

import SwiftUI

struct HintLayout: View {
	var page: String
	
    var body: some View {
		VStack {
			Image("hintCalcu")
				.resizable()
				.scaledToFit()
		}
    }
}

struct HintLayout_Previews: PreviewProvider {
    static var previews: some View {
        HintLayout(page: "hello")
			.previewInterfaceOrientation(.landscapeRight)
    }
}
