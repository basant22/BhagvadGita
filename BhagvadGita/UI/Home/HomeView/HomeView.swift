//
//  HomeView.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 10/09/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState:AppState
    var body: some View {
        NavigationStack(path:$appState.homeNavigation){
            VStack{
               
            }
            .navigationTitle(LocalizedStringKey("ContentView.bhagvad_gita_Title"))
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        appState.homeNavigation.append(.setting)
                    }label: {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(Color.customColor.primaryColor)
                        
                    }
                }
            }
            .navigationDestination(for: HomeNavDestination.self){ destination in
                switch destination{
                case .setting:
                    SettingView()
                case .languageSelection:
                    LanguageSelectionView()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
