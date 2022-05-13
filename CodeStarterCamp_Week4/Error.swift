//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum PersonError: Error {
    case personBeDrained
}

enum FitnessCenterError: Error {
    case emptyMember
    case emptyGoalsBodyCondition
    case memberBeDrained
}

enum KioskError: Error {
    case emptyData
    case forcedTermination
    case notEnglish
    case notNumber
    case notNaturalNumber
}

func printKioskErrorMessage(about error: KioskError) {
    if error == .forcedTermination {
        print(newLineString)
        print("Kiosk를 종료합니다.")
        exit(0)
    } else if error == .notEnglish {
        print(newLineString)
        print("입력하신 값은 영어가 아닙니다. 영어만 입력해 주세요.")
    } else if error == .notNumber {
        print(newLineString)
        print("입력하신 값은 숫자가 아닙니다. 숫자만 입력해 주세요.")
    } else if error == .notNaturalNumber {
        print(newLineString)
        print("입력하신 숫자는 자연수가 아닙니다. 자연수만 입력해 주세요.")
    } else {
        print(newLineString)
        print("입력된 데이터가 없습니다. 다시 입력해 주세요.")
    }
}

func printFitnessCenterErrorMessage(about error: FitnessCenterError) {
    if error == .memberBeDrained {
        print(newLineString)
        print("회원이 너무 힘들어서 도망갔습니다!!")
        exit(0)
    } else if error == .emptyMember {
        print(newLineString)
        print("Error : empty member")
        exit(0)
    } else {
        print(newLineString)
        print("Error : empty goalsBodyCondition")
        exit(0)
    }
}
