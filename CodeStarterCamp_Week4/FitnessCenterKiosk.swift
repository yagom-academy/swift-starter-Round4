//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func printKioskErrorMessage(about error: KioskError) {
    print(newLineString)
    if error == .forcedTermination {
        print("Kiosk를 종료합니다.")
        exit(0)
    } else if error == .notEnglish {
        print("입력하신 값은 영어가 아닙니다. 영어만 입력해 주세요.")
    } else if error == .notNumber {
        print("입력하신 값은 숫자가 아닙니다. 숫자만 입력해 주세요.")
    } else if error == .notNaturalNumber {
        print("입력하신 숫자는 자연수가 아닙니다. 자연수만 입력해 주세요.")
    } else {
        print("입력된 데이터가 없습니다. 다시 입력해 주세요.")
    }
}

struct FitnessCenterKiosk {
    func printMessageByStep(nowStep: Int) {
        print(newLineString)
        if nowStep == 1 {
            print("회원님의 이름을 입력해 주세요. * 이름은 영어만 입력해주세요.(공백, 특수문자 사용금지)")
        } else if nowStep == 2 {
            print("운동 목표치를 입력하세요.")
        } else if nowStep == 3 {
            print("운동하시고 싶은 Routine의 번호를 입력하세요.")
        } else {
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
    
    func receiveGoals() -> [Int]? {
        var goals = [Int]()
        while goals.count < 3 {
            printMessageCorresponds(to: goals.count)
            let enterResult = enterNaturalNumber()
            switch enterResult {
            case .success(let naturalNumber):
                goals.append(naturalNumber)
            case .failure(let error):
                printKioskErrorMessage(about: error)
            }
        }
        return goals
    }
    
    func printMessageCorresponds(to goalsPoint: Int) {
        print(newLineString)
        if goalsPoint == 0 {
            print("UpperBodyStrength 목표치.")
        } else if goalsPoint == 1{
            print("LowerBodyStrength 목표치.")
        } else {
            print("MuscleEndurance 목표치.")
        }
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
            } else if inputString == "" {
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

