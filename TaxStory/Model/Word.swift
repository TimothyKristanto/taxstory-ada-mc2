//
//  Word.swift
//  TaxStory
//
//  Created by Alex Lim on 28/06/23.
//

import UIKit

struct Word: Identifiable, Hashable,Equatable {
    var id = UUID().uuidString
    var value: String
    var padding: CGFloat = 10
    var offsiteX: CGFloat
    var offsiteY: CGFloat
    var isShowing: Bool = false
}
