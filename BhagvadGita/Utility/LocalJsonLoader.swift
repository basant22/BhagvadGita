//
//  LocalJsonLoader.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 26/08/24.
//

import Foundation

class LocalJsonLoader{
    func load<T:Decodable>(_ fileName:String, as _:T.Type = T.self) -> T?{
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {return nil}
        do{
            let data = try Data(contentsOf: url)
            let obj = try JSONDecoder().decode(T.self, from: data)
            return obj
        }catch let error{
            debugPrint("some error = \(error.localizedDescription)")
            return nil
        }
    }
}
