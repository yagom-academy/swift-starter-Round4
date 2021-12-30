//
//  ResultView.swift
//  CodeStarterCamp_Week4
//
//  Created by 조민호 on 2021/12/30.
//

import Foundation

struct ResultView {
    func printSuccessMessage(member: Person) {
        print("--------------")
        print("성공입니다! 현재 \(member.name)님의 컨디션은 다음과 같습니다.")
        print("상체근력: \(member.bodyCondition.upperBodyStrength)")
        print("하체근력: \(member.bodyCondition.lowerBodyStrength)")
        print("근지구력: \(member.bodyCondition.muscularEndurance)")
        print("피로도: \(member.bodyCondition.fatigue)")
    }
    
    func printError(fitnessError: FitnessError, member: Person) {
        switch fitnessError {
        case .fatigueFull:
            print("--------------")
            print("\(member.name)님의 피로도가 \(member.bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
        case .failToReachGoals:
            print("--------------")
            print("목표치에 도달하지 못했습니다. 현재 \(member.name)님의 컨디션은 다음과 같습니다.")
            print("상체근력: \(member.bodyCondition.upperBodyStrength)")
            print("하체근력: \(member.bodyCondition.lowerBodyStrength)")
            print("근지구력: \(member.bodyCondition.muscularEndurance)")
            print("피로도: \(member.bodyCondition.fatigue)")
            print("--------------")
        }
    }
}
