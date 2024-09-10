//
//  RadioButton.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 09/09/24.
//

import SwiftUI

struct RadioButton: View {
    var currentLanguage:SupportedLanguage
    var name:String
    @Binding var supportedLanguage:SupportedLanguage
    var body: some View {
        Button{
            supportedLanguage = currentLanguage
        }label: {
            HStack(spacing:20){
                Image(systemName: supportedLanguage == currentLanguage ? "circle.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.orange)
                    .scaledToFit()
               
                Text(LocalizedStringKey(name))
                    .font(.title)
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                Spacer()
                    
            }
            .padding(.horizontal,40)
            .frame(maxWidth:.infinity)
        }
    }
}

#Preview {
    RadioButton(currentLanguage: SupportedLanguage.english, name: "", supportedLanguage:.constant(SupportedLanguage.english) )
}
