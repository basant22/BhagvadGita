//
//  BhagvadGitaApp.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 16/08/24.
//

import SwiftUI

//import SwiftyBeaver
//let logger = SwiftyBeaver.self
@main
struct BhagvadGitaApp: App {
//    init() {
//            let console = ConsoleDestination()
//            logger.addDestination(console)
//            // etc...
//        }
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let persistenceController = PersistenceController.shared
    @AppStorage("isOnBoarding") var isOnBoarding:Bool = false
    @State var languageSetting = LanguageSetting()
    var body: some Scene {
        WindowGroup {
            if isOnBoarding{
                BGTabView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environment(languageSetting)
                    .environment(\.locale,languageSetting.locale)
            }else{
                OnBoardingView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environment(languageSetting)
                    .environment(\.locale,languageSetting.locale)
            }
           
        }
    }
}
