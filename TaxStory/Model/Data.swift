//
//  Data.swift
//  TaxStory
//
//  Created by Alex Lim on 10/07/23.
//

import Foundation

struct Emotion: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case pictureName
        case textBox
    }
    
    var id = UUID()
    var pictureName: String?
    var textBox: String
}
