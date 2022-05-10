//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by Jiyoung Lee on 2022/05/10.
//

import Foundation

struct FitnessCenter {
    let name: String
    var targetBodyCondition: BodyCondition
    var member: Person?
    var routines = [Routine]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addRoutine(routine: Routine) {
        self.routines.append(routine)
    }
    
    mutating func register(member: Person) {
        self.member = member
    }
    
    func checkMember(member: Person) throws {
        print("안녕하세요. \(self.name) 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        let name: String? = readLine()
        guard name == member.name else {
            throw FitnessProgramError.noMember
        }
    }
    
    mutating func setGoals() throws {
        print("운동 목표치를 순서대로 알려주세요.")
        print("상체근력", terminator: ": ")
        guard let targetUpperBodyStrength = Int(readLine()!) else {
            throw FitnessProgramError.inappropriateInput
        }
        self.targetBodyCondition.upperBodyStrength = targetUpperBodyStrength
        print("\(targetUpperBodyStrength)")
        print("하체근력", terminator: ": ")
        guard let targetLowerBodyStrength = Int(readLine()!) else {
            throw FitnessProgramError.inappropriateInput
        }
        self.targetBodyCondition.lowerBodyStrength = targetLowerBodyStrength
        print("\(targetLowerBodyStrength)")
        print("근지구력", terminator: ": ")
        guard let targetMuscularEndurance = Int(readLine()!) else {
            throw FitnessProgramError.inappropriateInput
        }
        self.targetBodyCondition.muscularEndurance = targetMuscularEndurance
        print("\(targetMuscularEndurance)")
        print("한계 피로도를 알려주세요.")
        print("한계 피로도", terminator: ": ")
        guard let targetFatigue = Int(readLine()!) else {
            throw FitnessProgramError.inappropriateInput
        }
        self.targetBodyCondition.fatigue = targetFatigue
        print("\(targetFatigue)")
    }
    
    func chooseRoutine() throws {
        print("몇 번째 루틴으로 운동하시겠어요?")
        routines.forEach { routine in
            var i = 0
            print("\(i + 1). \(routines[i])")
            i += 1
        }
        guard let routineNo = Int(readLine()!) else {
            throw FitnessProgramError.inappropriateInput
        }
        routines[routineNo-1].run()
    }
    
    func setRepetition() {
        
    }
    

    mutating func runFitnessProgram(member: Person) {
        
        do {
            try checkMember(member: member)
        } catch FitnessProgramError.noMember {
            print("회원 이름이 일치하지 않습니다.")
        }
        do {
            try setGoals()
        } catch FitnessProgramError.inappropriateInput {
            print("입력값이 잘못되었습니다. 정수로 입력해주세요")
        }
        do {
            try chooseRoutine()
        } catch FitnessProgramError.inappropriateInput {
            print("루틴을 다시 골라주세요.")
        }
        do {
            try setRepetition()
        } catch FitnessProgramError.inappropriateInput {
            
        }
        do
    }
//
//    func programSuccess() {
//        print("""
//            성공입니다! 현재 \()님의 컨디션은 다음과 같습니다.
//            상체근력: \(.upperBodyStrength)
//            하체근력: \(.lowerBodyStrength)
//            근지구력: \(.muscularEndurance)
//            피로도: \(.fatigue)
//            """
//        )
//    }
    
    func programFail() {
        
    }
}
