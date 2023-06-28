//
//  TaxStoryApp.swift
//  TaxStory
//
//  Created by Timothy on 20/06/23.
//

import SwiftUI

@main
struct TaxStoryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: AnswerViewModel())
        }
    }
}
