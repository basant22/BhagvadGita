//
//  SettingView.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 10/09/24.
//

import SwiftUI

struct SettingView: View {
    @Environment(LanguageSetting.self) var languageSetting
    @EnvironmentObject var appState:AppState
    var body: some View {
        VStack{
            HStack{
                Text(LocalizedStringKey("setting-language"))
                    .font(.title2)
                    .padding()
                Spacer()
            }
            .background(Color.customColor.primaryColor)
            .padding(.vertical)
            Button{
                appState.homeNavigation.append(.languageSelection)
            }label: {
                HStack{
                    Text(languageSetting.currentSelectedLanguage == .english ? "English" : "Hindi")
                        .font(.title2)
                        .padding()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .padding()
                }
                .border(.black)
                .frame(height: 50)
                .padding(.horizontal)
            }
           
            Spacer()
        }
      .navigationBarTitle(LocalizedStringKey("setting-title"),displayMode: .inline)
    }
}

#Preview {
    SettingView()
}
