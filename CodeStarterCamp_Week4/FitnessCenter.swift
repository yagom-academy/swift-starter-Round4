//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 홍승주 on 2022/05/10.
//

import Foundation

class FitnessCenter {
    let name: String
    var goalBodyCondition: BodyCondition
    var member: Person?
    var routine: [Routine]
    
    init(name: String, goalBodyCondition: BodyCondition, member: Person, routine: [Routine]) {
        self.name = name
        self.goalBodyCondition = goalBodyCondition
        self.member = member
        self.routine = routine
    }
    
    convenience init(name: String, routine: [Routine]) {
        self.init(name: "", goalBodyCondition: BodyCondition(upperBodyMuscleStrength: 0, lowerBodyMuscleStrength: 0, muscleEndurance: 0, fatigue: 0), member: Person(name: "", bodyCondition: BodyCondition(upperBodyMuscleStrength: 0, lowerBodyMuscleStrength: 0, muscleEndurance: 0, fatigue: 0)), routine: routine)
    }
    
    func setMember(name: String) {
        member = Person(name: name, bodyCondition: BodyCondition(upperBodyMuscleStrength: goalBodyCondition.upperBodyMuscleStrength, lowerBodyMuscleStrength: goalBodyCondition.lowerBodyMuscleStrength, muscleEndurance: goalBodyCondition.muscleEndurance, fatigue: goalBodyCondition.fatigue))
    }
    
    func startFitness() throws {
        print("안녕하세요. \(name) 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        guard let inputName: String = readLine() else {
            throw FitnessError.wrongInput
        }
        setMember(name: inputName)
    }
    
    func goalStat() throws {
        print("운동 목표치를 순서대로 알려주세요")
        print("상체근력: ", terminator: "")
        guard let goalUpperBodyMuscleStrength = Int(readLine()!) else {
            throw FitnessError.wrongInput
        }
        goalBodyCondition.upperBodyMuscleStrength = goalUpperBodyMuscleStrength
        print("하체큰력: ", terminator: "")
        guard let goalLowerBodyMuscleStrength = Int(readLine()!) else {
            throw FitnessError.wrongInput
        }
        goalBodyCondition.lowerBodyMuscleStrength = goalLowerBodyMuscleStrength
        print("근지구력: ", terminator: "")
        guard let goalMuscleEndurance = Int(readLine()!) else {
            throw FitnessError.wrongInput
        }
        goalBodyCondition.muscleEndurance = goalMuscleEndurance
        print("한계 피로도: ", terminator: "")
        guard let goalFatigue = Int(readLine()!) else {
            throw FitnessError.wrongInput
        }
        goalBodyCondition.fatigue = goalFatigue
    }
    
    func selectRoutine() throws -> Routine {
        var selectRoutine: Routine
        print("몇 번째 루틴으로 운동하시겠어요? ")
        for number in 0..<routine.count {
            print("\(number+1). \(routine[number].routineName)")
        }
        guard let routineNumber = Int(readLine()!) else {
            throw FitnessError.wrongInput
        }
        selectRoutine = routine[routineNumber - 1]
        return selectRoutine
    }
    
    func selectSet() throws -> Int {
        var set: Int
        print("몇 세트 반복하시겠어요?")
        guard let repeatSet = Int(readLine()!) else {
            throw FitnessError.wrongInput
        }
        set = repeatSet
        return set
    }
    
    func runRoutine()  throws {
        try startFitness()
        try goalStat()
        if let member = member {
            while true {
                do {
                    let routine = try selectRoutine()
                    let repeatNumber = try selectSet()
                    try member.exercise(for: repeatNumber, routine: routine)
                    compareStat()
                    break
                }
            }
        }
    }
    
    func compareStat() {
        if let member = member {
            if member.bodyCondition.upperBodyMuscleStrength >= goalBodyCondition.upperBodyMuscleStrength &&
                member.bodyCondition.lowerBodyMuscleStrength >= goalBodyCondition.lowerBodyMuscleStrength &&
                  member.bodyCondition.muscleEndurance >= goalBodyCondition.muscleEndurance {
                    successRoutine()
                  }
            failRoutine()
        }
    }
    
    func successRoutine() {
        if let member = member {
            print("""
            --------------
            성공입니다! 현재 \(member.name)님의 컨디션은 다음과 같습니다.
            """)
            member.bodyCondition.checkBodyCondition()
        }
    }
    
    func failRoutine() {
        if let member = member {
            print("""
            --------------
            목표치에 도달하지 못했습니다. 현재 \(member.name)님의 컨디션은 다음과 같습니다.
            """)
            member.bodyCondition.checkBodyCondition()
        }
    }
}
