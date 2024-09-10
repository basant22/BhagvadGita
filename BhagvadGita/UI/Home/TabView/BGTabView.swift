//
//  BGTabView.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 10/09/24.
//

import SwiftUI

struct BGTabView: View {
    @StateObject  var appState = AppState()
    var body: some View {
        TabView(selection:createTabBinding()){
            HomeView()
                .tag(BGViewTab.home)
                .tabItem {
                    Image(systemName: "house")
                    Text(LocalizedStringKey("tabview-home"))
                }
            QuotesView()
                .tag(BGViewTab.quotes)
                .tabItem {
                    Image(systemName: "text.quote")
                    Text(LocalizedStringKey("tabview-quote"))
                }
            SavedView()
                .tag(BGViewTab.saved)
                .tabItem {
                    Image(systemName: "folder")
                    Text(LocalizedStringKey("tabview-save"))
                }
            AboutView()
                .tag(BGViewTab.about)
                .tabItem {
                    Image(systemName: "info.circle")
                    Text(LocalizedStringKey("tabview-about"))
                }
        }
        .accentColor(Color.customColor.primaryColor)
        .environmentObject(appState)
    }
   fileprivate func createTabBinding()->Binding<BGViewTab>{
        Binding<BGViewTab>(
            get: {
                appState.selectedTab
            },
            set: {selectedTab in
                if selectedTab == appState.selectedTab{
                    switch selectedTab{
                    case .home:
                        if !appState.homeNavigation.isEmpty{
                            withAnimation{
                                appState.homeNavigation = []
                            }
                        }
                    case .about:
                        if !appState.aboutNavigation.isEmpty{
                            withAnimation{
                                appState.aboutNavigation = []
                            }
                        }
                    case .quotes:
                        if !appState.quotesNavigation.isEmpty{
                            withAnimation{
                                appState.quotesNavigation = []
                            }
                        }
                    case .saved:
                        if !appState.savedNavigation.isEmpty{
                            withAnimation{
                                appState.savedNavigation = []
                            }
                        }
                    }
                }
                appState.selectedTab = selectedTab
            }
        )
    }
}

#Preview {
    BGTabView()
}

 class AppState:ObservableObject{
    @Published var selectedTab:BGViewTab = .home
    @Published var homeNavigation :[HomeNavDestination] = []
    @Published var quotesNavigation :[QuotesNavDestination] = []
    @Published var savedNavigation :[SavedNavDestination] = []
    @Published var aboutNavigation :[AboutNavDestination] = []
}

 enum BGViewTab{
    case home
    case quotes
    case saved
    case about
}
enum HomeNavDestination{
    case setting
    case languageSelection
}
enum AboutNavDestination{
    case details1
}
enum SavedNavDestination{
    case details2
}
enum QuotesNavDestination{
    case details3
}
