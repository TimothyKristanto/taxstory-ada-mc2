//
//  BackgroundBlurLayout.swift
//  TaxStory
//
//  Created by Timothy on 11/07/23.
//

import Foundation
import SwiftUI

struct BackgroundBlurLayout: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
