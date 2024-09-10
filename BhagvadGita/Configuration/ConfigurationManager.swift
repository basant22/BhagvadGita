//
//  ConfigurationManager.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 16/08/24.
//

import Foundation
private enum BuildConfiguration{
    enum Error:Swift.Error{
        case missingKey,invalidValue
    }
    static func value<T>(for key:String) throws -> T where T:LosslessStringConvertible{
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else{
            throw Error.missingKey
        }
        switch object{
        case let string as String:
            guard let value = T(string) else {fallthrough}
            return value
        default:
            throw Error.invalidValue
        }
    }
}
enum API{
    static var baseURL:String{
        do{
            return try BuildConfiguration.value(for:"BASE_URL")
        }catch{
            fatalError(error.localizedDescription)
        }
    }
}

enum ConfigurationManager{
    enum Environment:String{
        case dev = "dev"
        case prod = "prod"
        case qa = "qa"
    }
    static var environment:Environment{
#if Dev
        return .dev
#elseif Prod
        return .prod
#else 
        return .qa
#endif
    }
}
