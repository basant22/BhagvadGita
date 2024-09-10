//
//  AboutView.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 10/09/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView{
            VStack{
                Image("Gita3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(ImageOverlay(),alignment: .bottomLeading)
                HStack{
                    Image("quotes")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.leading,20)
                        .padding(.top,20)
                       Spacer()
                }
                
                Text(LocalizedStringKey("gita-sar"))
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding()
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.yellow)
                HStack{
                    Image("daisy")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                    Text(LocalizedStringKey("Start"))
                        .font(.title2)
                        .foregroundStyle(Color.customColor.primaryColor)
                    Image("daisy")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                }
                Text(LocalizedStringKey("gita-start"))
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding()
                    .multilineTextAlignment(.leading)
                   
                HStack{
                    Image("daisy")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                    Text(LocalizedStringKey("Conclusion"))
                        .font(.title2)
                        .foregroundStyle(Color.customColor.primaryColor)
                    Image("daisy")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                }
                Text(LocalizedStringKey("gita-content"))
                    .font(.title2)
                    .fontWeight(.heavy)
                    .padding()
                    .multilineTextAlignment(.leading)
                    //.foregroundStyle(Color.customColor.primaryColor)
            }
        }
    }
}
struct ImageOverlay: View {
    var body: some View {
        ZStack{
            Text("About Us")
                .font(.title)
                .fontWeight(.heavy)
                //.foregroundStyle(.white)
                .foregroundStyle(.yellow)
        }
        .padding(.leading,20)
        .padding(.bottom,20)
    }
}

#Preview {
    AboutView()
}
