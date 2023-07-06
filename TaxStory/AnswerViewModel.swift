//
//  AnswerViewModel.swift
//  TaxStory
//
//  Created by Alex Lim on 28/06/23.
//

import SwiftUI

class AnswerViewModel:NSObject, ObservableObject {
    
    @Published var progress : CGFloat = 0
    @Published var characters: [Word] = [Word(value: "1-1-391-911-2135", offsiteX: 0, offsiteY: 1), Word(value: "01.512.002.2", offsiteX: -156, offsiteY: -115), Word(value: "PT Apple Developer Academy", offsiteX: -312, offsiteY: -60), Word(value: "Rp. 105,359", offsiteX: -468, offsiteY: 68), Word(value: "31-12-2023", offsiteX: -623, offsiteY: 138)]
    //ganti goal penempatan aaaaaa contoh lanjut --> Word(value: "page1puzzle2", offsiteX: 10, offsiteY: -10)
//    @Published var characters: [Word] = [Word(value: "01.512.002.2", offsiteX: 1, offsiteY: 1), Word(value: "1-1-391-011-2135", offsiteX: -152, offsiteY: -115)]
//               Word(value: "is"),
//               Word(value: "playing"),
//               Word(value: "football"),
//               Word(value: "since"),
//               Word(value: "morning.")]
    
    @Published var shuffledRows: [[Word]] = []
    @Published var rows: [[Word]] = []
    
    @Published var animateWrongText = false
    @Published var droppedCount: CGFloat = 0
 
    func generateGrid() -> [[Word]] {
        var gridArray: [[Word]] = []
        var tempArray: [Word] = []
        let currentWidth: CGFloat = 0
        let totalScreenWidth:CGFloat = CGFloat(UIScreen.main.bounds.width - 30)
        
        for character in characters {
            
            if currentWidth < totalScreenWidth {
                tempArray.append(character)
                
            }else {
                gridArray.append(tempArray)
                tempArray = []
                tempArray.append(character)
            }
        }
        
        if !tempArray.isEmpty {
            gridArray.append(tempArray)
        }
        
        return gridArray
        
    }
    func shuffleArray() {
        if rows.isEmpty {
            rows =  generateGrid()
//            characters =  characters.shuffled()
            shuffledRows =  generateGrid()
        }
    }
    
    func updateSuffledArray(character:Word) {
        for index in shuffledRows.indices {
            for subIndex in shuffledRows[index].indices {
                if shuffledRows[index][subIndex].id == character.id {
                    shuffledRows[index][subIndex].isShowing = true
                }
            }
        }
    }
}

