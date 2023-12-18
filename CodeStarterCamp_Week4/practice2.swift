//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by Nat Kim on 2023/12/18.
//

import Foundation


class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int

    init(upperBodyStrength: Int,
         lowerBodyStrength: Int,
         muscularEndurance: Int,
         fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }

    
    func doSquat() {
        let lowerBodyStrengthIncrease = Int.random(in: 20...30)
        let fatigueIncrease = Int.random(in: 10...20)

        print("<<스쿼트를 시작합니다>>")
        print("하체근력이 \(lowerBodyStrengthIncrease) 상승합니다.")
        print("피로도가 \(fatigueIncrease) 상승합니다.")

        lowerBodyStrength += lowerBodyStrengthIncrease
        fatigue += fatigueIncrease

        print("--------------")
    }

    func doLongDistanceRunning() {
        let muscularEnduranceIncrease = Int.random(in: 20...30)
        let upperBodyStrengthIncrease = Int.random(in: 5...10)
        let lowerBodyStrengthIncrease = Int.random(in: 5...10)
        let fatigueIncrease = Int.random(in: 20...30)

        print("<<오래달리기를 시작합니다>>")
        print("근지구력이 \(muscularEnduranceIncrease) 상승합니다.")
        print("상체근력이 \(upperBodyStrengthIncrease) 상승합니다.")
        print("하체근력이 \(lowerBodyStrengthIncrease) 상승합니다.")
        print("Fatigue increased by \(fatigueIncrease).")

        muscularEndurance += muscularEnduranceIncrease
        upperBodyStrength += upperBodyStrengthIncrease
        lowerBodyStrength += lowerBodyStrengthIncrease
        fatigue += fatigueIncrease

        print("--------------")
    }

    func takeDynamicRest() {
        let fatigueDecrease = Int.random(in: 5...10)

        print("<<동적휴식을 시작합니다>>")
        print("피로도가 \(fatigueDecrease) 하락합니다.")

        fatigue -= fatigueDecrease

        print("--------------")
    }
}


struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    mutating func CheckAfterActivityCondition() {
        print("Current condition:")
        print("Upper body strength: \(upperBodyStrength)")
        print("Lower body strength: \(lowerBodyStrength)")
        print("Muscular endurance: \(muscularEndurance)")
        print("Fatigue: \(fatigue)")
        print("--------------")
    }
}

let sitUp: Activity = Activity(name: "윗몸일으키기") { bodyCodition in
    
    let upperBodyStrengthIncrease = Int.random(in: 10...20)
    let fatigueIncrease = Int.random(in: 10...20)
    
    print("<<윗몸일으키기를 시작합니다>>")
    print("상체 근력이 \(upperBodyStrengthIncrease) 상승합니다.")
    print("피로도가 \(fatigueIncrease) 상승합니다.")
    bodyCodition.upperBodyStrength += upperBodyStrengthIncrease
    bodyCodition.fatigue += fatigueIncrease
    print("--------------")
}

// Example usage
//var currentCondition = BodyCondition(upperBodyStrength: 100, lowerBodyStrength: 70, muscularEndurance: 60, fatigue: 10)
//
//currentCondition.sitUp()
//currentCondition.doSquat()
//currentCondition.doLongDistanceRunning()
//currentCondition.takeDynamicRest()

// Print the final condition
//print("현재의 컨디션은 다음과 같습니다.")
//print("상체근력: \(currentCondition.upperBodyStrength)")
//print("하체근력: \(currentCondition.lowerBodyStrength)")
//print("근지구력: \(currentCondition.muscularEndurance)")
//print("피로도: \(currentCondition.fatigue)")
//print("--------------")

