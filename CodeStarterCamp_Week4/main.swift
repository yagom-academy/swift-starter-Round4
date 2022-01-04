//  main.swift
//  CodeStarterCamp_Week4
//  Created by quokka
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
    
    init(name: String, exercises: [Exercise]) {
        self.name = name
        self.exercises = exercises
    }
}

enum Routines {
    case uppperBodyExercise
    case lowerBodyExercise
    case backExercise
    case chestExercise
    case shoulderExercise
    case aerobicExercise
    
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
        case .aerobicExercise:
            return "유산소운동"
        }
    }
}

struct Person {
    let name: String
    let bodyCondition: BodyCondition
    
    func exercise(for set: Int, routines: [Routine], at fitnessCenter: FitnessCenter) throws {
        for count in 1...set {
            guard self.bodyCondition.fatigue < 100 else {
                throw FitnessCenter.Errors.fatigueIsOver
            }
            print("--------------")
            print("\(routines[1].name)을 \(count)set시작합니다.")
            routines.forEach { $0.exercises[1].action() }
            
            guard self.bodyCondition.uppperBodyStrength >= fitnessCenter.goalBodyCondition.uppperBodyStrength ||
                self.bodyCondition.lowerBodyStrength >=
                fitnessCenter.goalBodyCondition.lowerBodyStrength ||
                self.bodyCondition.muscularEndurance >=
                fitnessCenter.goalBodyCondition.muscularEndurance else {
                    throw FitnessCenter.Errors.wasNotGoalIn
            }
        }
        self.bodyCondition.checkCurrentBodyCondition()
    }
}

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
let strengthTraining = Routine(name: Routines.aerobicExercise.name, exercises: [runLong,runLong,activeRest])
var yagomFitnessCenter = FitnessCenter(goalBodyCondition: kaui.bodyCondition, member: kaui,
                                       routines: [upperBodyExercise, lowerBodyStrength,         strengthTraining])

do {
    try yagomFitnessCenter.startFitnessProgram(member: yagomFitnessCenter.member, routines: yagomFitnessCenter.routines, at: yagomFitnessCenter)
} catch FitnessCenter.Errors.canNotFindMember {
    print(FitnessCenter.Errors.canNotFindMember.description)
} catch FitnessCenter.Errors.wrongInput {
    print(FitnessCenter.Errors.wrongInput.description)
} catch FitnessCenter.Errors.fatigueIsOver {
    print(FitnessCenter.Errors.fatigueIsOver.description)
} catch FitnessCenter.Errors.wasNotGoalIn {
    print(FitnessCenter.Errors.wasNotGoalIn.description)
} catch FitnessCenter.Errors.doesntNotFindRoutineNumber {
    print(FitnessCenter.Errors.doesntNotFindRoutineNumber.description)
}
