//
//  DataViewModel.swift
//  TaxStory
//
//  Created by Alex Lim on 10/07/23.
//

import Foundation


class ReadData: ObservableObject  {
    @Published var emotions = [Emotion]()
    
        
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "DataStored", withExtension: "json")
            else
        {
            print("Json file not found")
            return
            
        }
        
        let data = try? Data(contentsOf: url)
        let emotions = try? JSONDecoder().decode([Emotion].self, from: data!)
        self.emotions = emotions!
        
    }
     
}
