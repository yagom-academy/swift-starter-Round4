//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int = 0
    var lowerBodyStrength: Int = 0
    var muscularEndurance: Int = 0
    var fatigueLevel: Int = 0
}

func limitsRangeLevelUp(min: Int, max: Int) -> Int {
    return Int.random(in: min...max)
}

func limitsRangeLevelDown(min: Int, max: Int) -> Int {
    return -Int.random(in: min...max)
}

struct Exercise {
    let name: String
    let upperLevel: () -> BodyCondition
}

struct Routine {
    let name: String
    var order: Array<Exercise>
    
    func playRoutine() -> BodyCondition {
        var tempBodyCondition = BodyCondition()
        print("--------------")
        print("\(name)을 시작합니다.")
        
        for exercise in order {
            print(exercise.name)
            let condition = exercise.upperLevel()
            tempBodyCondition.upperBodyStrength += condition.upperBodyStrength
            tempBodyCondition.lowerBodyStrength += condition.lowerBodyStrength
            tempBodyCondition.muscularEndurance += condition.muscularEndurance
            tempBodyCondition.fatigueLevel += condition.fatigueLevel
        }
        
        return tempBodyCondition
    }
}

let pushup = Exercise(name: "푸쉬업") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.upperBodyStrength = limitsRangeLevelUp(min: 20, max: 30)
    bodyCondtion.lowerBodyStrength = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.muscularEndurance = limitsRangeLevelUp(min: 10, max: 20)
    bodyCondtion.fatigueLevel = limitsRangeLevelUp(min: 10, max: 20)
    return bodyCondtion
}

let squat = Exercise(name: "스쿼트") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.upperBodyStrength = limitsRangeLevelUp(min: 0, max: 0)
        bodyCondtion.lowerBodyStrength = limitsRangeLevelUp(min: 20, max: 30)
    bodyCondtion.muscularEndurance = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.fatigueLevel = limitsRangeLevelUp(min: 10, max: 20)
    return bodyCondtion
}

let sitUp = Exercise(name: "윗몸일으키기") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.upperBodyStrength = limitsRangeLevelUp(min: 10, max: 20)
    bodyCondtion.lowerBodyStrength = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.muscularEndurance = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.fatigueLevel = limitsRangeLevelUp(min: 10, max: 20)
    return bodyCondtion
}

let running = Exercise(name: "오래달리기") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.upperBodyStrength = limitsRangeLevelUp(min: 5, max: 10)
    bodyCondtion.lowerBodyStrength = limitsRangeLevelUp(min: 5, max: 10)
    bodyCondtion.muscularEndurance = limitsRangeLevelUp(min: 20, max: 30)
    bodyCondtion.fatigueLevel = limitsRangeLevelUp(min: 20, max: 30)
    return bodyCondtion
}

let buffyTest = Exercise(name: "버피테스트") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.upperBodyStrength = limitsRangeLevelUp(min: 20, max: 30)
    bodyCondtion.lowerBodyStrength = limitsRangeLevelUp(min: 20, max: 30)
    bodyCondtion.muscularEndurance = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.fatigueLevel = limitsRangeLevelUp(min: 10, max: 20)
    return bodyCondtion
}

let legRaise = Exercise(name: "레그레이즈") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.upperBodyStrength = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.lowerBodyStrength = limitsRangeLevelUp(min: 20, max: 30)
    bodyCondtion.muscularEndurance = limitsRangeLevelUp(min: 0, max: 0)
    bodyCondtion.fatigueLevel = limitsRangeLevelUp(min: 10, max: 20)
    return bodyCondtion
}

let relaxtion = Exercise(name: "동적휴식") {
    var bodyCondtion = BodyCondition()
    bodyCondtion.fatigueLevel = limitsRangeLevelDown(min: 5, max: 10)
    return bodyCondtion
}

let HellRoutine = Routine(
    name: "hellRoutine",
    order: [
        sitUp,
        sitUp,
        relaxtion,
        legRaise,
        legRaise,
        relaxtion,
        buffyTest,
        buffyTest
    ])

let OmgRoutine = Routine(
    name: "omgRoutine",
    order: [
        sitUp,
        legRaise,
        squat,
        pushup,
        relaxtion,
        sitUp,
        legRaise,
        squat,
        pushup
    ])

struct Person {
    var name: String
    var bodyCondition = BodyCondition()
    
    func exercise(for set: Int, routine: Routine){
    }
}

enum FitnessErrorCase: Error {
    case overFatigueLevel
    case failAim
    case incongruityInput
    case noMembers
    case typeErrorNotInt
    case anotherERROR
}

struct FitnessCenter {
    let name: String
    let aimBodyCondtion = BodyCondition()
    var members: Array<Person>?
    var routineList: [Routine]
    
    mutating func runProgram() throws -> Void {
        let personMember = try checkMember()
        
        print("운동 목표치를 순서대로 알려주세요. 예시) 상체근력:130,하체근력:120,근지구력:150 \n상체근력 :", terminator: " ")
        let upperStrength: String? = readLine()
        print("하체근력 :", terminator: " ")
        let lowerStrength: String? = readLine()
        print("근지구력 :", terminator: " ")
        let muscularEndurance: String? = readLine()
        
        let totalRoutines = self.routineList.map {
            $0.name
        }
        print("몇 번째 루틴으로 운동하시겠어요?")
        var routineCount = 0
        for routine in totalRoutines{
            routineCount += 1
            print("\(routineCount). \(routine)")
        }
        let routineNumber: String? = readLine()
        guard let routines = routineNumber else {
            throw FitnessErrorCase.incongruityInput
        }
        guard let choicedRoutineCount = Int(routines) else {
            throw FitnessErrorCase.typeErrorNotInt
        }
        let choiceRoutine = self.routineList[choicedRoutineCount - 1]
        
        print("몇 세트 반복하시겠어요? ",terminator: "")
        let routineSetCount: String? = readLine()
        guard let routineNumber = routineSetCount else {
            throw FitnessErrorCase.incongruityInput
        }
        guard let choicedSetCount = Int(routineNumber) else {
            throw FitnessErrorCase.typeErrorNotInt
        }
        
        var memberBodyCondtion = BodyCondition()
        print("\(choiceRoutine.name)를(을) \(choicedSetCount)set시작합니다.")
    
        for _ in 1...choicedSetCount {
            let condtions = choiceRoutine.playRoutine()
            memberBodyCondtion.upperBodyStrength += condtions.upperBodyStrength
            memberBodyCondtion.lowerBodyStrength += condtions.lowerBodyStrength
            memberBodyCondtion.muscularEndurance += condtions.muscularEndurance
            memberBodyCondtion.fatigueLevel += condtions.fatigueLevel
            
            if memberBodyCondtion.fatigueLevel > 100 {
                print("\(personMember.name)님의 피로도가 \(memberBodyCondtion.fatigueLevel)입니다. 회원님이 도망갔습니다.")
                throw FitnessErrorCase.overFatigueLevel
            }
        }
        
        guard let upperStrength = upperStrength else {
            throw FitnessErrorCase.incongruityInput
        }
        guard let lowerStrength = lowerStrength else {
            throw FitnessErrorCase.incongruityInput
        }
        guard let muscularEndurance = muscularEndurance else {
            throw FitnessErrorCase.incongruityInput
        }
        
        guard let convertedUpperStrength = Int(upperStrength) else {
            throw FitnessErrorCase.typeErrorNotInt
        }
        guard let convertedLowerStrength = Int(lowerStrength) else {
            throw FitnessErrorCase.typeErrorNotInt
        }
        guard let convertedMuscularEndurance = Int(muscularEndurance) else {
            throw FitnessErrorCase.typeErrorNotInt
        }
        
        if memberBodyCondtion.upperBodyStrength > convertedUpperStrength || memberBodyCondtion.lowerBodyStrength > convertedLowerStrength || memberBodyCondtion.muscularEndurance > convertedMuscularEndurance {
            print("목표치에 도달하지 못했습니다 \(personMember.name)님의 현재 컨디션은")
            print("상체근력 : \(memberBodyCondtion.upperBodyStrength)")
            print("하체근력 : \(memberBodyCondtion.lowerBodyStrength)")
            print("근지구력 : \(memberBodyCondtion.muscularEndurance)")
            print("입니다.")
            
            throw FitnessErrorCase.failAim
        }

        print("--------------")
        print("성공입니다! 현재 \(personMember.name)님의 컨디션은 다음과 같습니다.")
        print("상체근력 : \(memberBodyCondtion.upperBodyStrength)")
        print("하체근력 : \(memberBodyCondtion.lowerBodyStrength)")
        print("근지구력 : \(memberBodyCondtion.muscularEndurance)")
        print("피로도 : \(memberBodyCondtion.fatigueLevel)")
    }
    
    mutating func checkMember() throws -> Person {
        print("안녕하세요. \(name) 피트니스 센터입니다. 회원님의 이름은 무엇인가요?", terminator: " ")
        let inputName: String? = readLine()
        guard let inputName = inputName else {
            throw FitnessErrorCase.incongruityInput
        }
        guard let findingMembers = self.members else {
            print("cannot use Array")
            throw FitnessErrorCase.anotherERROR
        }
        let personsMemberName = findingMembers.map {
            $0.name
        }
        guard personsMemberName.contains(inputName) else {
            throw FitnessErrorCase.noMembers
        }
        guard let membersIndex = personsMemberName.firstIndex(of: inputName) else {
            throw FitnessErrorCase.anotherERROR
        }
        return findingMembers[membersIndex]
    }
}

var beam2 = Person(name: "beam2")
var beam3 = Person(name: "beam3")
var beam4 = Person(name: "beam4")
var beam2Fit = FitnessCenter(name: "뱀이피트", members: [beam2, beam3, beam4], routineList: [HellRoutine, OmgRoutine])

do {
    try beam2Fit.runProgram()
} catch FitnessErrorCase.noMembers {
    print("인원 없음")
} catch FitnessErrorCase.overFatigueLevel{
    print("")
} catch FitnessErrorCase.failAim{
    print("")
}
