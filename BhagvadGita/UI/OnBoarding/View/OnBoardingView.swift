//
//  OnBoardingView.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 26/08/24.
//

import SwiftUI

struct OnBoardingView: View {
    @ObservedObject var viewModel = OnBoardingViewModel()
    @State var currentIndex = 0
    @State private var showPopup = false
    @AppStorage("isOnBoarding") var isOnBoarding:Bool = false
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $currentIndex){
                ForEach(0..<viewModel.onBoardingData.count,id:\.self){ index in
                    OnBoardingInteriorView(model: viewModel.onBoardingData[index])
                }
            }.tabViewStyle(.page)
            VStack{
                Spacer()
                conrolBar
                Spacer()
                    .frame(height:60)
                if currentIndex < viewModel.onBoardingData.count-1{
                    HStack{
                        Spacer().frame(width:10)
                        Button{
                            currentIndex = viewModel.onBoardingData.count-1
                        }label: {
                            Text(LocalizedStringKey("Skip"))
                        }
                        Spacer()
                        Button{
                            currentIndex += 1
                        }label: {
                            Text(LocalizedStringKey("Next"))
                        }
                        Spacer().frame(width:10)
                    }
                }else{
                    HStack{
                       
                        Button{
                           showPopup = true
                            isOnBoarding = true
                        }label: {
                            Text(LocalizedStringKey("Change Language"))
                                .frame(height: 40)
                                .frame(maxWidth:.infinity)
                                .foregroundStyle(.white)
                                
                        }
                        .background(
                                     Color.purple.opacity(0.8),
                                     in: RoundedRectangle(
                                         cornerRadius: 16,
                                         style: .continuous
                                     )
                                   )
                        .padding(.horizontal,5)
                        
                    }
                }
                Spacer()
                    .frame(height:40)
            }
            if showPopup{
                ZStack{
                    Color.black.opacity(0.50)
                    VStack{
                        Spacer()
                        ChangeLanguagePopUpView(showPopup: $showPopup)
                        Spacer()
                    }
                }
            }
        }.ignoresSafeArea()
    }
    @ViewBuilder
    private var conrolBar: some View{
        HStack{
            Spacer()
            PageControl(currentPage: $currentIndex, numberOfPage: viewModel.onBoardingData.count)
            Spacer()
        }
    }
}

#Preview {
    OnBoardingView()
}
