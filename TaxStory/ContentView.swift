//
//  ContentView.swift
//  TaxStory
//
//  Created by Timothy on 20/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm : AnswerViewModel
    var body: some View {
        FillForm(vm: AnswerViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: AnswerViewModel())
    }
}
