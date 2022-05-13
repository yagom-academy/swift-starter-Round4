//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct FitnessCenterKiosk {
    func printMessageByStep(nowStep: Int) {
        switch nowStep {
        case 1:
            print(newLineString)
            print("회원님의 이름을 입력해 주세요. * 이름은 영어만 입력해주세요.(공백, 특수문자 사용금지)")
        case 2:
            print(newLineString)
            print("운동 목표치를 입력하세요.")
        case 3:
            print(newLineString)
            print("운동하시고 싶은 Routine의 번호를 입력하세요.")
        default :
            print(newLineString)
            print("몇 세트를 반복하시겠습니까?")
        }
    }
    
    func receiveEnglishName() -> String? {
        var englishName: String?
        let enterResult = enterEnglishName()
        switch enterResult {
        case .success(let data):
            englishName = data
        case .failure(let error):
            printKioskErrorMessage(about: error)
        }
        return englishName
    }
    
    func enterEnglishName() -> Result<String, KioskError> {
        print("입력란(강제종료:q!) : ", terminator: "")
        if let name = readLine() {
            if name == "q!" {
                return .failure(.forcedTermination)
            } else if name == "" {
                return .failure(.emptyData)
            }
            if checkIsEnglish(target: name) {
                return .success(name)
            } else {
                return .failure(.notEnglish)
            }
        } else {
            return .failure(.emptyData)
        }
    }
    
    func checkIsEnglish(target: String) -> Bool {
        let upperTarget = target.uppercased()
        for character in upperTarget.unicodeScalars {
            if !(character.value >= 65 && character.value <= 90) {
                return false
            }
        }
        return true
    }
    
    func receiveNaturalNumber() -> Int? {
        var NaturalNumber: Int?
        let enterResult = enterNaturalNumber()
        switch enterResult {
        case .success(let data):
            NaturalNumber = data
        case .failure(let error):
            printKioskErrorMessage(about: error)
        }
        return NaturalNumber
    }
    
    func enterNaturalNumber() -> Result<Int, KioskError> {
        print("입력란 (자연수만 입력)(강제종료:q!) : ", terminator: "")
        if let inputString = readLine() {
            if inputString == "q!" {
                return .failure(.forcedTermination)
            } else if name == "" {
                return .failure(.emptyData)
            }
            if let naturalNumber = Int(inputString) {
                if naturalNumber > 0 {
                    return .success(naturalNumber)
                } else {
                    return .failure(.notNaturalNumber)
                }
            } else {
                return .failure(.notNumber)
            }
        } else {
            return .failure(.emptyData)
        }
    }
}
