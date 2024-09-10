//
//  LanguageSelectionView.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 10/09/24.
//

import SwiftUI

struct LanguageSelectionView: View {
    @Environment(LanguageSetting.self) var languageSetting
    @EnvironmentObject var appState:AppState
    @State private var selectedLanguage:SupportedLanguage = .english
    var body: some View {
        VStack{
            ForEach(SupportedLanguage.allCases,id: \.self){ language in
                Button{
                    selectedLanguage = language
                }label: {
                    HStack{
                        Text(language.rawValue)
                            .font(.title2)
                            .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                        Spacer()
                        
                        if language == selectedLanguage{
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.customColor.primaryColor)
                                .padding()
                        }
                    }.padding(.horizontal,10)
                }
            }
            Spacer()
            Button{
                languageSetting.setLocale(language: selectedLanguage)
                appState.homeNavigation.removeLast()
            }label: {
                Text(LocalizedStringKey("setting-save-change"))
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(height:40)
                    .frame(maxWidth:.infinity)
                    .foregroundStyle(.white)
                    .background(Color.customColor.primaryColor,in:RoundedRectangle(cornerRadius: 16.0, style: .continuous))
            }
            .padding()
        }
        .onAppear{
            selectedLanguage = languageSetting.currentSelectedLanguage
        }
        .navigationBarTitle(LocalizedStringKey("setting-language"),displayMode: .inline)
    }
}

#Preview {
    LanguageSelectionView()
}
