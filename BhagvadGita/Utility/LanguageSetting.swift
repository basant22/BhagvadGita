//
//  LanguageSetting.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 09/09/24.
//

import Foundation
@Observable
class LanguageSetting{
    enum ConstantKey:String{
        case languageKey = "language-key"
        case applelanguage = "AppleLanguages"
    }
    var locale:Locale = .current{
        didSet{
            
        }
    }
    var currentSelectedLanguage:SupportedLanguage = .english{
        didSet{
            
        }
    }
    init(){
        setupInitialLanguage()
    }
    func setupInitialLanguage(){
        if let language = UserDefaults.standard.string(forKey: ConstantKey.languageKey.rawValue),
                 let value = SupportedLanguage(rawValue: language) {
            setLocale(language: value)
        }else{
            if let languageArray = UserDefaults.standard.array(forKey:  ConstantKey.applelanguage.rawValue),let language = languageArray.first as? String{
                if language.contains("hi"){
                    setLocale(language: .hindi)
                }else{
                    setLocale(language: .english)
                }
            }
        }
    }
    func setLocale(language:SupportedLanguage){
        switch language {
        case .english:
            locale = Locale(identifier: "en")
            UserDefaults.standard.setValue(SupportedLanguage.english.rawValue, forKey: ConstantKey.languageKey.rawValue)
            currentSelectedLanguage = .english
            UserDefaults.standard.synchronize()
        case .hindi:
            locale = Locale(identifier: "hi")
            UserDefaults.standard.setValue(SupportedLanguage.hindi.rawValue, forKey: ConstantKey.languageKey.rawValue)
            currentSelectedLanguage = .hindi
            UserDefaults.standard.synchronize()
        }
    }
}
