//
//  bodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by karen on 2023/03/19.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet {
            print("상체근력이 \(printChangeValue(self.upperBodyStrength - oldValue))")
        }
    }
    var lowerBodyMuscleStrength: Int{
        didSet {
            print("하체근력이 \(printChangeValue(self.lowerBodyMuscleStrength - oldValue))")
        }
    }
    var muscularEndurance: Int{
        didSet {
            print("근지구력이 \(printChangeValue(self.muscularEndurance - oldValue))")
        }
    }
    var degreeOfFatigue: Int{
        didSet {
            print("피로도가 \(printChangeValue(self.degreeOfFatigue - oldValue))")
        }
    }
    
    func printChangeValue(_ changeValue: Int) -> String {
        let changeValueText: String
        let changeInt: Int
        if changeValue > 0 {
            changeValueText = "\(changeValue) 상승합니다."
        } else if changeValue < 0 {
            changeInt = changeValue * -1
            changeValueText = "\(changeInt) 하락합니다."
        } else {
            changeValueText = "변화 없습니다."
        }
        return changeValueText
    }
    
    func printCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체 근력 : \(upperBodyStrength)")
        print("하체 근력 : \(lowerBodyMuscleStrength)")
        print("근지구력 : \(muscularEndurance)")
        print("피로도 : \(degreeOfFatigue)")
    }
    
    init(upperBodyStrength: Int, lowerBodyMuscleStrength: Int, muscularEndurance: Int, degreeOfFatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyMuscleStrength = lowerBodyMuscleStrength
        self.muscularEndurance = muscularEndurance
        self.degreeOfFatigue = degreeOfFatigue
    }
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: {
    print("<<\(sitUp.name)을(를) 시작합니다.>>")
    $0.upperBodyStrength += Int.random(in:10...20)
    $0.degreeOfFatigue += Int.random(in:10...20)
})

let squats: Activity = Activity(name: "스쿼트", action: {
    print("<<\(squats.name)을(를) 시작합니다.>>")
    $0.lowerBodyMuscleStrength += Int.random(in:20...30)
    $0.degreeOfFatigue += Int.random(in:10...20)
})

let longRun: Activity = Activity(name: "오래달리기", action: {
    print("<<\(longRun.name)을(를) 시작합니다.>>")
    $0.muscularEndurance += Int.random(in:20...30)
    $0.upperBodyStrength += Int.random(in:5...10)
    $0.lowerBodyMuscleStrength += Int.random(in:5...10)
    $0.degreeOfFatigue += Int.random(in:10...20)
})

let dynamicResting: Activity = Activity(name: "동적휴식", action: {
    print("<<\(dynamicResting.name)을(를) 시작합니다.>>")
    $0.degreeOfFatigue -= Int.random(in:5...10)
})
