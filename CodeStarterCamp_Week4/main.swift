//  main.swift
//  CodeStarterCamp_Week4
//  Created by quokka.
//  Copyright © yagom academy. All rights reserved.

import Foundation

struct BodyCondition {
    var uppperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(uppperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.uppperBodyStrength = uppperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }

    func checkCurrentBodyCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("\(InBody.uppperBodyStrength.name): \(self.uppperBodyStrength)")
        print("\(InBody.lowerBodyStrength.name): \(self.lowerBodyStrength)")
        print("\(InBody.muscularEndurance.name): \(self.muscularEndurance)")
        print("\(InBody.fatigue.name): \(self.fatigue)")
    }
}

enum InBody {
    case uppperBodyStrength
    case lowerBodyStrength
    case muscularEndurance
    case fatigue
    
    var name: String {
        switch self {
        case .uppperBodyStrength:
            return "상체근력"
        case .lowerBodyStrength:
            return "하체근력"
        case .muscularEndurance:
            return "근지구력"
        case .fatigue:
            return "피로도"
        }
    }
}

struct Exercise {
    let name: String
    let action: () -> Void
}

enum Exercises {
    case sitUp
    case squart
    case runLong
    case pushUp
    case activeRest
    
    var name: String {
        switch self {
        case .sitUp:
            return "윗몸일으키기"
        case .squart:
            return "스쿼트"
        case .runLong:
            return "오래달리기"
        case .pushUp:
            return "푸쉬업"
        case .activeRest:
            return "동적휴식"
        }
    }
}

struct Routine {
    let name: String
    let exercises: [Exercise]
}

enum Routines {
    case uppperBodyExercise
    case lowerBodyExercise
    case backExercise
    case chestExercise
    case shoulderExercise
    
    var name: String {
        switch self {
        case .uppperBodyExercise:
            return "상체운동"
        case .lowerBodyExercise:
            return "하체운동"
        case .backExercise:
            return "등운동"
        case .chestExercise:
            return "가슴운동"
        case .shoulderExercise:
            return "어깨운동"
        }
    }
}

struct Person {
    let name: String
    let bodyCondition: BodyCondition
    
    func exercise(for set: Int, routine: Routine) {
        
    }
}

struct FitnessCenter {
    let goalBodyCondition: BodyCondition
    let member: Person?
    let routines: [String: Routine]
    
    func startFitnessProgram(member: Person?, routine: Routine) throws {
        print("\(Guidance.helloWhatYourName.message)?")
        guard let inputMemberName = readLine()?.replacingOccurrences(of: " ", with: ""),
              inputMemberName == self.member?.name else {
                  throw Errors.canNotFindMember
              }
        
        print("\(Guidance.tellMeYourGoalBodyCondition.message).\n\(Guidance.upperBodyStrength.message): ", terminator: "")
        guard let uppperBodyStrength = readLine(), let _ = Int(uppperBodyStrength) else {
            throw Errors.wrongInput
        }
        print("\n\(Guidance.lowerBodyStrength.message): ", terminator: "")
        guard let lowerBodyStrength = readLine(), let _ = Int(lowerBodyStrength) else {
            throw Errors.wrongInput
        }
        print("\n\(Guidance.muscularEndurance.message): ", terminator: "")
        guard let muscularEndurance = readLine(), let _ = Int(muscularEndurance) else {
            throw Errors.wrongInput
        }
        
        print("\(Guidance.WhatRoutineWouldYouLikeToWorkOn.message)?")
        for key in self.routines.keys {
            var keysOrderCounter = 1
            print("\(keysOrderCounter). \(key)\n")
            keysOrderCounter += 1
        }
        guard let routineChoise = readLine(), let intRoutineChoise = Int(routineChoise),
              intRoutineChoise <= self.routines.keys.count else {
                  throw Errors.wrongInput
              }
        
        print("\(Guidance.howManyRepeatTheRoutine.message)?")
        guard let stringRepeatCount = readLine(), let intRepeatCount = Int(stringRepeatCount) else {
            throw Errors.wrongInput
        }
        member?.exercise(for: intRepeatCount, routine: routine)
        // 루틴이 끝났을때 목표치에 미도달할 경우
        // 진행 도중 회원의 피로도가 100을 넘은 경우
    }
    
    enum Guidance {
        case helloWhatYourName
        case tellMeYourGoalBodyCondition
        case WhatRoutineWouldYouLikeToWorkOn
        case upperBodyStrength
        case lowerBodyStrength
        case muscularEndurance
        case howManyRepeatTheRoutine
        
        var message: String {
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
        case onlyInputTheIntType
    }
}
extension FitnessCenter.Errors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .fatigueIsOver:
            return "피로도 초과했습니다."
        case .wasNotGoalIn:
            return "목표치 미도달 하였습니다."
        case .wrongInput:
            return "잘못된 입력입니다."
        case .canNotFindMember:
            return "회원을 찾을 수 없습니다."
        case .unexpected:
            return "알수없는 오류발생"
        case .onlyInputTheIntType:
            return "숫자만입력가능합니다."
        }
    }
}
let kaui = Person(name: "quokka", bodyCondition: quokka)
var quokka = BodyCondition(uppperBodyStrength: 0, lowerBodyStrength: 0,
                           muscularEndurance: 0, fatigue: 0)
let sitUp = Exercise(name: Exercises.sitUp.name) {
    print("\(sitUp.name)")
    quokka.uppperBodyStrength += Int.random(in: 10...20)
    quokka.fatigue += Int.random(in: 10...20)
}
let squart = Exercise(name: Exercises.squart.name) {
    print("\(squart.name)")
    quokka.lowerBodyStrength += Int.random(in: 20...30)
    quokka.fatigue += Int.random(in: 10...20)
}
let runLong = Exercise(name: Exercises.runLong.name) {
    print("\(runLong.name)")
    quokka.muscularEndurance += Int.random(in: 20...30)
    quokka.uppperBodyStrength += Int.random(in: 5...10)
    quokka.lowerBodyStrength += Int.random(in: 5...10)
    quokka.fatigue += Int.random(in: 20...30)
}
let pushUp = Exercise(name: Exercises.pushUp.name) {
    print("\(pushUp.name)")
    quokka.fatigue -= Int.random(in: 5...10)
}
let activeRest = Exercise(name: Exercises.activeRest.name) {
    print("\(activeRest.name)")
    quokka.uppperBodyStrength += Int.random(in: 10...15)
    quokka.fatigue += Int.random(in: 5...10)
}

let upperBodyExercise = Routine(name: Routines.uppperBodyExercise.name,
                                exercises: [pushUp, sitUp,
                                            pushUp, sitUp,
                                            activeRest])
let lowerBodyStrength = Routine(name: Routines.lowerBodyExercise.name,
                                exercises: [squart, squart,
                                            activeRest, squart,
                                            squart, activeRest])
var yagomFitnessCenter = FitnessCenter(goalBodyCondition: kaui.bodyCondition, member: kaui, routines: [Routines.uppperBodyExercise.name: upperBodyExercise])

do {
    try yagomFitnessCenter.startFitnessProgram(member: yagomFitnessCenter.member, routine: upperBodyExercise)
} catch(let error) {
    print(error)
}

func workOut(_ routine: Routine, person: BodyCondition) {
    print("--------------")
    print("\(routine.name) 루틴을 시작합니다.")
    routine.exercises.forEach { $0.action() }
    person.checkCurrentBodyCondition()
}
//workOut(upperBodyExercise, person: quokka)
