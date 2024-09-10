//
//  ChangeLanguagePopUpView.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 09/09/24.
//

import SwiftUI
enum SupportedLanguage:String,CaseIterable{
    case english = "English"
    case hindi = "हिंदी"
}
struct ChangeLanguagePopUpView: View {
    @Binding var showPopup:Bool
    @State private var selectedLanguage = SupportedLanguage.english
    @Environment(LanguageSetting.self) var languageSetting
    var body: some View {
        VStack(alignment:.center){
            Spacer().frame(height:20)
            Image("abcd")
                .resizable()
                .frame(width: 160, height: 160)
                .scaledToFit()
                Spacer()
            Text(LocalizedStringKey("Choose your preferred language"))
                .font(.title)
                .foregroundStyle(.gray)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
//            Text("preferred language")
//                .font(.title)
//                .foregroundStyle(.gray)
//                .fontWeight(.heavy)
            Spacer()
        Text(LocalizedStringKey("Don't worry you can change it later"))
            .font(.caption)
            .foregroundStyle(.black)
            .fontWeight(.regular)
            Spacer()
            VStack(alignment: .leading){
                RadioButton(currentLanguage: .hindi,name: "Hindi", supportedLanguage: $selectedLanguage)
                RadioButton(currentLanguage: .english,name: "English", supportedLanguage: $selectedLanguage)
            }
            .padding(.all,40)
            Spacer()
            Button{
                showPopup = false
            }label: {
                Text(LocalizedStringKey("Ok, Let's go!"))
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(height: 40)
                    .frame(maxWidth:.infinity)
            }
            .background(Color.purple.opacity(0.8),
                        in:RoundedRectangle(cornerRadius: 16.0, style: .continuous)
            )
            .padding()
        }
        .onChange(of: selectedLanguage, { oldValue, newValue in
            languageSetting.setLocale(language: newValue)
        })
        .onAppear{
            selectedLanguage = languageSetting.currentSelectedLanguage
//            if languageSetting.locale.identifier.contains("en"){
//                selectedLanguage = .english
//            }else{
//                selectedLanguage = .hindi
//            }
        }
        .background(.white,in:RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(radius: 5)
            .padding(.horizontal,20)
            .padding(.vertical,60)
    }
}

#Preview {
    ChangeLanguagePopUpView(showPopup: .constant(false))
}
