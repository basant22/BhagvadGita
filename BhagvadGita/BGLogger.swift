//
//  BGLogger.swift
//  BhagvadGita
//
//  Created by Kumar Basant on 16/08/24.
//

import Foundation
import SwiftyBeaver
protocol BGLoggerType{
    func verbose(_ mesaage:String, _ file:String, _ function:String, _ line:Int)
    func debug(_ mesaage:String, _ file:String, _ function:String, _ line:Int)
    func info(_ mesaage:String, _ file:String, _ function:String, _ line:Int)
    func warning(_ mesaage:String, _ file:String, _ function:String, _ line:Int)
    func error(_ mesaage:String, _ file:String, _ function:String, _ line:Int)
}
extension BGLoggerType{
    func verbose(_ mesaage: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        verbose(mesaage, file, function, line)
    }
    func debug(_ mesaage: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        debug(mesaage, file, function, line)
    }
    func info(_ mesaage: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        info(mesaage, file, function, line)
    }
    func warning(_ mesaage: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        warning(mesaage, file, function, line)
    }
    func error(_ mesaage: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        error(mesaage, file, function, line)
    }
}
class BGLogger : BGLoggerType{
    func verbose(_ mesaage: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.verbose(mesaage,file: file,function: function,line:line)
    }
    
    func debug(_ mesaage: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.debug(mesaage,file: file,function: function,line:line)
    }
    
    func info(_ mesaage: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.info(mesaage,file: file,function: function,line:line)
    }
    
    func warning(_ mesaage: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.warning(mesaage,file: file,function: function,line:line)
    }
    
    func error(_ mesaage: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.error(mesaage,file: file,function: function,line:line)
    }
    
   private let log = SwiftyBeaver.self
    init(){
        let console = ConsoleDestination()
        log.addDestination(console)
    }
   
    func verbose() {
        log.verbose("not so important")
    }
    
    func debug() {
        log.debug("something to debug")
    }
    
    func info() {
        log.info("a nice information")
    }
    
    func warning() {
        log.warning("oh no, that won’t be good")
    }
    
    func error() {
        log.error("ouch, an error did occur!")
    }

}
