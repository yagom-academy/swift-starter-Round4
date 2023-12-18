//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Nat Kim on 2023/12/19.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(
        upperBodyStrength: Int,
        lowerBodyStrength: Int,
        muscularEndurance: Int,
        fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func performActivity(_ activity: ActivityType) {
        switch activity {
        case .sitUp:
            performSitUp()
        case .squat:
            performSquat()
        case .longDistanceRunning:
            performLongDistanceRunning()
        case .yoga:
            performDoingYoga()
        case .dynamicRest:
            performDynamicRest()
        
        }
    }
    
    func performSitUp() {
        let upperBodyStrengthIncrease = Int.random(in: 10...20)
        let fatigueIncrease = Int.random(in: 10...20)
        upperBodyStrength += upperBodyStrengthIncrease
        fatigue += fatigueIncrease
        printStartMessage(
            activity: .sitUp,
            upperBodyStrengthIncrease: upperBodyStrengthIncrease,
            fatigueIncrease: fatigueIncrease
        )
    }
    
    func performSquat() {
        let lowerBodyStrengthIncrease = Int.random(in: 20...30)
        let fatigueIncrease = Int.random(in: 10...20)
        lowerBodyStrength += lowerBodyStrengthIncrease
        fatigue += fatigueIncrease
        printStartMessage(
            activity: .squat,
            lowerBodyStrengthIncrease: lowerBodyStrengthIncrease,
            fatigueIncrease: fatigueIncrease
        )
    }
    
    func performLongDistanceRunning() {
        let muscularEnduranceIncrease = Int.random(in: 20...30)
        let upperBodyStrengthIncrease = Int.random(in: 5...10)
        let lowerBodyStrengthIncrease = Int.random(in: 5...10)
        let fatigueIncrease = Int.random(in: 20...30)
        muscularEndurance += muscularEnduranceIncrease
        upperBodyStrength += upperBodyStrengthIncrease
        lowerBodyStrength += lowerBodyStrengthIncrease
        fatigue += fatigueIncrease
        printStartMessage(
            activity: .longDistanceRunning,
            upperBodyStrengthIncrease: upperBodyStrengthIncrease,
            lowerBodyStrengthIncrease: lowerBodyStrengthIncrease,
            muscularEnduranceIncrease: muscularEnduranceIncrease,
            fatigueIncrease: fatigueIncrease
        )
    }
    
    func performDynamicRest() {
        let fatigueDecrease = Int.random(in: 5...10)
        fatigue -= fatigueDecrease
        printStartMessage(
            activity: .dynamicRest,
            fatigueIncrease: -fatigueDecrease
        )
    }
    
    func performDoingYoga() {
        let muscularEnduranceIncrease = Int.random(in: 10...20)
        let upperBodyStrengthIncrease = Int.random(in: 5...10)
        let lowerBodyStrengthIncrease = Int.random(in: 5...10)
        let fatigueDecrease = Int.random(in: 5...10)
        fatigue -= fatigueDecrease
        printStartMessage(
            activity: .yoga,
            fatigueIncrease: -fatigueDecrease
        )
    }
    
    private func printStartMessage(
        activity: ActivityType,
        upperBodyStrengthIncrease: Int = 0,
        lowerBodyStrengthIncrease: Int = 0,
        muscularEnduranceIncrease: Int = 0,
        fatigueIncrease: Int = 0) {
        print("<<💁🏻‍♀️ \(activity.rawValue) 을(를) 시작합니다.>>")
        switch activity {
        case .sitUp:
            print("상체근력이 \(upperBodyStrengthIncrease) 상승합니다.")
            print("피로도가 \(fatigueIncrease) 상승합니다.")
        case .squat:
            print("하체근력이 \(lowerBodyStrengthIncrease) 상승합니다.")
            print("피로도가 \(fatigueIncrease) 상승합니다.")
        case .longDistanceRunning:
            print("근지구력이 \(muscularEnduranceIncrease) 상승합니다.")
            print("상체근력이 \(upperBodyStrengthIncrease) 상승합니다.")
            print("하체근력이 \(lowerBodyStrengthIncrease) 상승합니다.")
            print("피로도가 \(fatigueIncrease) 상승합니다.")
        case .yoga:
            print("근지구력이 \(muscularEnduranceIncrease) 상승합니다.")
            print("상체근력이 \(upperBodyStrengthIncrease) 상승합니다.")
            print("하체근력이 \(lowerBodyStrengthIncrease) 상승합니다.")
            print("피로도가 \(fatigueIncrease) 하락합니다.")
        case .dynamicRest:
            print("피로도가 \(fatigueIncrease) 하락합니다.")
        }
    }
    
    func printCurrentCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigue)")
        print("--------------")
    }
}
