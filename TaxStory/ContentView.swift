//
//  ContentView.swift
//  TaxStory
//
//  Created by Timothy on 20/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var page: String = "mainMenu"
    
    var body: some View {
        if page == "mainMenu"{
            MainMenuStart(page: $page)
        }else if page == "mapCase"{
            MapCase(page: $page)
        }else if page == "case3"{
            Case3View()
        }
        
//        VisualNovel(, DataJSON: <#[Data]#>)
        
//        ChooseFormView()
//        FillForm(vm: vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
