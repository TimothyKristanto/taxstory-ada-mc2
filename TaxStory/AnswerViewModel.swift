//
//  AnswerViewModel.swift
//  TaxStory
//
//  Created by Alex Lim on 28/06/23.
//

import SwiftUI

class AnswerViewModel:NSObject, ObservableObject {
    
    @Published var progress : CGFloat = 0
    @Published var characters: [Word] = [Word(value: "page1puzzle2", offsiteX: 1, offsiteY: 1), Word(value: "page1puzzle1", offsiteX: -152, offsiteY: -115), Word(value: "page1puzzle3", offsiteX: -305, offsiteY: -60)] //ganti goal penempatan aaaaaa contoh lanjut --> Word(value: "page1puzzle2", offsiteX: 10, offsiteY: -10)
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
        var currentWidth: CGFloat = 0
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
            characters =  characters.shuffled()
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

