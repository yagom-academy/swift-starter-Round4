//
//  step1.swift
//  CodeStarterCamp_Week4
//
//  Created by smfc on 12/7/2022.
//

import Foundation
import SwiftUI

let numberbetween5to10 = 5...10
let numberbetween10to20 = 10...20
let numberbetween20to30 = 20...30

struct BodyCondition {
    var upperBodyMuscleStrength: Int = Int.random(in: numberbetween10to20)
    var lowerBodyMuscleStrength: Int = Int.random(in: numberbetween10to20)
    var muscularEndurance: Int = Int.random(in: numberbetween10to20)
    var bodyFatigue: Int = Int.random(in: numberbetween10to20)
    
    mutating func changeUpperBodyMuscleStrength(add number: Int) {
        self.upperBodyMuscleStrength += number
    }
    
    mutating func changeLowerBodyMuscleStrength(add number: Int) {
        self.lowerBodyMuscleStrength += number
    }
    
    mutating func changeMuscularEndurance(add number: Int) {
        self.muscularEndurance += number
    }
    
    mutating func plusBodyFatigue(number: Int) {
        self.bodyFatigue += number
    }
    
    mutating func minusBodyFatigue(number: Int) {
        self.bodyFatigue -= number
    }
    
    func printCondition() {
        print("""
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBodyMuscleStrength)
        하체근력: \(lowerBodyMuscleStrength)
        근지구력: \(muscularEndurance)
        피로도: \(bodyFatigue)
        --------------
        """)
    }
}

var conditonOfJae: BodyCondition = BodyCondition()

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { (bodyCondition: BodyCondition) in
    let randomeNumberForUpperBody = Int.random(in: numberbetween10to20)
    let randomeNumberForFatigue = Int.random(in: numberbetween10to20)
    conditonOfJae.changeUpperBodyMuscleStrength(add: randomeNumberForUpperBody)
    conditonOfJae.plusBodyFatigue(number: randomeNumberForFatigue)
    print("상체근력이 \(randomeNumberForUpperBody)만큼 상승합니다.")
    print("피로도가 \(randomeNumberForFatigue)만큼 상승합니다.")
})

let squart: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    let randomeNumberForLowerBody = Int.random(in: numberbetween20to30)
    let randomeNumberForFatigue = Int.random(in: numberbetween10to20)
    conditonOfJae.changeLowerBodyMuscleStrength(add: randomeNumberForLowerBody)
    conditonOfJae.plusBodyFatigue(number: randomeNumberForFatigue)
    print("하체근력이 \(randomeNumberForLowerBody)만큼 상승합니다.")
    print("피로도가 \(randomeNumberForFatigue)만큼 상승합니다.")
})

let longDistanceRunning: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    let randomeNumberForMuscularEndurance = Int.random(in: numberbetween20to30)
    let randomeNumberForUpperBody = Int.random(in: numberbetween5to10)
    let randomeNumberForLowerBody = Int.random(in: numberbetween5to10)
    let randomeNumberForFatigue = Int.random(in: numberbetween20to30)
    conditonOfJae.changeMuscularEndurance(add: randomeNumberForMuscularEndurance)
    conditonOfJae.changeUpperBodyMuscleStrength(add: randomeNumberForUpperBody)
    conditonOfJae.changeLowerBodyMuscleStrength(add: randomeNumberForLowerBody)
    conditonOfJae.plusBodyFatigue(number: randomeNumberForFatigue)
    print("근지구력이 \(randomeNumberForMuscularEndurance)만큼 상승합니다.")
    print("상체근력이 \(randomeNumberForUpperBody)만큼 상승합니다.")
    print("하체근력이 \(randomeNumberForLowerBody)만큼 상승합니다.")
    print("피로도가 \(randomeNumberForFatigue)만큼 상승합니다.")
})

let activeRest: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    let randomeNumberForFatigue = Int.random(in: numberbetween5to10)
    if (conditonOfJae.bodyFatigue - randomeNumberForFatigue < 0) {
        conditonOfJae.bodyFatigue = 0
        print("피로도가 0이 되었습니다.")
    } else {
        conditonOfJae.minusBodyFatigue(number: randomeNumberForFatigue)
        print("피로도가 \(randomeNumberForFatigue)만큼 하락합니다.")
    }
})
