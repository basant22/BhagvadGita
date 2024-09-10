//
//  PageControl.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 09/09/24.
//

import Foundation
import SwiftUI
import UIKit

struct PageControl:UIViewRepresentable{
    @Binding var currentPage:Int
    var numberOfPage:Int
    func makeCoordinator()->Coordinator{
        Coordinator(currentPage: $currentPage)
    }
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = 1
        control.pageIndicatorTintColor = UIColor(red: 150/255, green: 227/255, blue: 215/255, alpha: 1.0)
        control.currentPageIndicatorTintColor = UIColor(red: 60/255, green: 185/255, blue: 160/255, alpha: 1.0)
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(context.coordinator, action: #selector(Coordinator.pageControlDidFire(_:)), for: .valueChanged)
        return control
    }
    func updateUIView(_ control: UIPageControl, context: Context) {
        context.coordinator.currentPage = $currentPage
        control.currentPage = currentPage
        control.numberOfPages = numberOfPage
        
    }
    class Coordinator{
        var currentPage:Binding<Int>
        init(currentPage: Binding<Int>) {
            self.currentPage = currentPage
        }
        @objc
        func pageControlDidFire(_ control:UIPageControl){
            currentPage.wrappedValue = control.currentPage
        }
    }
}

