//
//  ContentView.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 16/08/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
   
    
let chapter = "1"
    var body: some View {
        VStack{
            Text(LocalizedStringKey("ContentView.bhagvad_gita_Chapter \(chapter)"))
        }.onAppear{
            let log:BGLoggerType = BGLogger()
            log.debug(API.baseURL)
            log.debug(ConfigurationManager.environment.rawValue)
        }
    } 
}



#Preview {
    ContentView()
}
