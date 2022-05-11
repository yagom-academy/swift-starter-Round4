//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum ConsoleControlerError: Error {
    case emptyData
    case notEnglish
    case notNumber
    case notNaturalNumber
    case forcedTermination
}


struct ConsoleControler {
    func receiveInputData() throws -> String {
        if let inputString = readLine() {
            if inputString == "q!" {
                throw ConsoleControlerError.forcedTermination
            }
            return inputString
        } else {
            throw ConsoleControlerError.emptyData
        }
    }
}

//let receiveInputEnglish = ConsoleControler() {
//    if let inputString = readLine() {
//        if inputString == "q!" {
//            throw ConsoleControlerError.forcedTermination
//        }
//        let upperInputString = inputString.uppercased()
//        for character in upperInputString.unicodeScalars {
//            if !(character.value >= 97 && character.value <= 122) {
//                throw ConsoleControlerError.notEnglish
//            }
//        }
//        return inputString
//    } else {
//        throw ConsoleControlerError.emptyData
//    }
//}

//let receiveInputNaturalNumber = ConsoleControler() {
//    if let inputString = readLine() {
//        if inputString == "q!" {
//            throw ConsoleControlerError.forcedTermination
//        }
//        if let inputStringToInt = Int(inputString) {
//            if inputStringToInt < 0 {
//                throw ConsoleControlerError.notNaturalNumber
//            }
//            return inputStringToInt
//        } else {
//            throw ConsoleControlerError.notNumber
//        }
//    } else {
//        throw ConsoleControlerError.emptyData
//    }
//}
