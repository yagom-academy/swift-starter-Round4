//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by LIMGAUI on 2022/01/04.
//

import Foundation

struct FitnessCenter {
    var goalBodyCondition: BodyCondition
    let member: Person?
    let routines: [Routine]
    
    mutating func startFitnessProgram(member: Person?, routines: [Routine], at fitnesscenter: FitnessCenter) throws {
        print("\(Guidance.helloWhatYourName.description)?")
        guard let inputMemberName = readLine()?.replacingOccurrences(of: " ", with: ""),
              inputMemberName == self.member?.name else {
                  throw Errors.canNotFindMember
              }
        
        print("\(Guidance.tellMeYourGoalBodyCondition.description).\n\(Guidance.upperBodyStrength.description): ", terminator: "")
        guard let uppperBodyStrength = readLine()?.replacingOccurrences(of: " ", with: ""),
              let intUppperBodyStrength = Int(uppperBodyStrength) else {
                  throw Errors.wrongInput
              }
        self.goalBodyCondition.uppperBodyStrength = intUppperBodyStrength
        print("\(Guidance.lowerBodyStrength.description): ", terminator: "")
        guard let lowerBodyStrength = readLine()?.replacingOccurrences(of: " ", with: ""),
              let intLowerBodyStrength = Int(lowerBodyStrength) else {
                  throw Errors.wrongInput
              }
        self.goalBodyCondition.lowerBodyStrength = intLowerBodyStrength
        print("\(Guidance.muscularEndurance.description): ", terminator: "")
        guard let muscularEndurance = readLine()?.replacingOccurrences(of: " ", with: ""),
              let intMuscularEndurance = Int(muscularEndurance) else {
                  throw Errors.wrongInput
              }
        self.goalBodyCondition.muscularEndurance = intMuscularEndurance
        
        print("\(Guidance.WhatRoutineWouldYouLikeToWorkOn.description)?")
        var routineCounter = 1
        for routine in self.routines {
            print("\(routineCounter). \(routine.name)")
            routineCounter += 1
        }
        guard let routineChoise = readLine()?.replacingOccurrences(of: " ", with: ""),
              let intRoutineChoise = Int(routineChoise),
              intRoutineChoise <= self.routines.count else {
                  throw Errors.doesntNotFindRoutineNumber
              }
        
        print("\(Guidance.howManyRepeatTheRoutine.description)?")
        guard let stringRepeatCount = readLine()?.replacingOccurrences(of: " ", with: ""),
              let intRepeatCount = Int(stringRepeatCount) else {
                  throw Errors.wrongInput
              }
        try member?.exercise(for: intRepeatCount, routines: routines, at: fitnesscenter)
    }
    
    enum Guidance {
        case helloWhatYourName
        case tellMeYourGoalBodyCondition
        case WhatRoutineWouldYouLikeToWorkOn
        case upperBodyStrength
        case lowerBodyStrength
        case muscularEndurance
        case howManyRepeatTheRoutine
        
        var description: String {
            switch self {
            case .helloWhatYourName:
                return "안녕하세요 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?"
            case .tellMeYourGoalBodyCondition:
                return "운동 목표치를 순서대로 알려주세요"
            case .upperBodyStrength:
                return "상체근력"
            case .lowerBodyStrength:
                return "하체근력"
            case .muscularEndurance:
                return "근지구력"
            case .WhatRoutineWouldYouLikeToWorkOn:
                return "몇 번째 루틴으로 운동하시겠어요"
            case .howManyRepeatTheRoutine:
                return "몇 세트 반복하시겠어요"
            }
        }
    }

    enum Errors: Error {
        case fatigueIsOver
        case wasNotGoalIn
        case wrongInput
        case canNotFindMember
        case unexpected
        case doesntNotFindRoutineNumber
        
        var description: String {
            switch self {
            case .fatigueIsOver:
                return "피로도 초과했습니다."
            case .wasNotGoalIn:
                return "목표치 미도달 하였습니다."
            case .wrongInput:
                return "잘못된 입력입니다. 다시입력해주세요.(숫자만입력가능)"
            case .canNotFindMember:
                return "회원을 찾을 수 없습니다."
            case .unexpected:
                return "알수없는 오류발생"
            case .doesntNotFindRoutineNumber:
                return "잘못된 입력입니다. (목록번호만)다시입력해주세요"
            }
        }
    }
}
