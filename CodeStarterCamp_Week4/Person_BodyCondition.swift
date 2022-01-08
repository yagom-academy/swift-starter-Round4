//
//  Person_BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 조성훈 on 2022/01/06.
//

import Foundation

class Person {
    var name: String
    var personalBodyCondition = BodyCondition()
    var myFitnesscenter: FitnessCenter
    
    init (name: String, myFitnesscenter: FitnessCenter) {
        self.name = name
        self.myFitnesscenter = myFitnesscenter
    }
    
    func printRecentBodyCondition() {
        print("""
            상체근력: \(personalBodyCondition.upperBodyStrength)
            하체근력: \(personalBodyCondition.lowerBodyStrength)
            근지구력: \(personalBodyCondition.muscleEndurance)
            피로도: \(personalBodyCondition.fatigue)
            """)
    }
    
    func exercise(for set: Int, routine: Routine) {
        for setOrder in 1...set {
            print("--------------")
            print("\(routine.name)을 \(setOrder)Set시작합니다.")
            for element in 1...routine.exerciseArray.count where personalBodyCondition.fatigue < 140 {
                print(routine.exerciseArray[element-1].name)
                routine.exerciseArray[element-1].action(personalBodyCondition)
            }
        }
        guard personalBodyCondition.fatigue < 140 else {
            print("--------------")
            print("\(name)님의 피로도가 \(personalBodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
            return
        }
        
        if personalBodyCondition.upperBodyStrength >= inputGoalOfBodyCondition.upperBodyStrength &&
            personalBodyCondition.lowerBodyStrength >= inputGoalOfBodyCondition.lowerBodyStrength &&
            personalBodyCondition.muscleEndurance >= inputGoalOfBodyCondition.muscleEndurance {
            print("--------------")
            print("성공입니다! 현재 \(name)님의 컨디션은 다음과 같습니다.")
            printRecentBodyCondition()
        } else {
            print("--------------")
            print("목표치에 도달하지 못했습니다. 현재 \(name)님의 컨디션은 다음과 같습니다.")
            printRecentBodyCondition()
            let restartRoutine = myFitnesscenter.checkSelectRoutine()
            exercise(for: 1, routine: restartRoutine)
        }
    }
}

class BodyCondition {
    var upperBodyStrength = 0
    var lowerBodyStrength = 0
    var muscleEndurance = 0
    var fatigue = 0
}



