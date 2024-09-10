//
//  OnBoardingInteriorView.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 09/09/24.
//

import SwiftUI

struct OnBoardingInteriorView: View {
    var model:OnBoardingModel
   @State private var isAnimation = false
    var body: some View {
        VStack(spacing:20){
            Spacer().frame(height:80)
            Image(model.image)
                .resizable()
                .scaledToFit()
                .scaleEffect(isAnimation ? 1.0 : 0.5)
            Text(LocalizedStringKey(model.title))
           // Text("ContentView.bhagvad_gita_Title")
                .foregroundStyle(.gray)
                .font(.title)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.horizontal,3)
            Text(LocalizedStringKey(model.description))
                .foregroundStyle(.black)
                .font(.subheadline)
                .multilineTextAlignment(.center)
            Spacer()
        }.onAppear{
            withAnimation(.easeOut(duration: 0.5)){
                isAnimation = true
            }
        }
    }
}

