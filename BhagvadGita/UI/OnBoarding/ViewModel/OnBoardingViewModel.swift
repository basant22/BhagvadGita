//
//  OnBoardingViewModel.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 26/08/24.
//

import Foundation

class OnBoardingViewModel:ObservableObject{
    @Published var onBoardingData = [OnBoardingModel]()
    private var localJsonLoader:LocalJsonLoader
    init() {
        localJsonLoader = LocalJsonLoader()
        loadOnBoardinModel()
    }
    func loadOnBoardinModel(){
        guard let response:[OnBoardingModel] = localJsonLoader.load("onBoardings") else {return}
        onBoardingData = response
       
    }
}
