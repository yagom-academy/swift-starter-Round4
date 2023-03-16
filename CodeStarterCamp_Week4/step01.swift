//
//  step01.swift
//  CodeStarterCamp_Week4
//
//  Created by karen on 2023/03/14.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
}

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
        
        if changeValue > 0 {
            changeValueText = "\(changeValue) 상승합니다."
        } else if changeValue < 0 {
            changeValueText = "\(changeValue) 하락합니다."
        } else {
            changeValueText = "변화 없습니다."
        }
        
        return "\(changeValueText)"
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

func startTraining (_ activity: Activity, _ bodyCondition: BodyCondition) {
    activity.action(bodyCondition)
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    print("<<\(sitUp.name)을(를) 시작합니다.>>")
    bodyCondition.upperBodyStrength += Int.random(in:10...20)
    bodyCondition.degreeOfFatigue += Int.random(in:10...20)
    bodyCondition.printCondition()
})

let squats: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<\(squats.name)을(를) 시작합니다.>>")
    bodyCondition.lowerBodyMuscleStrength += Int.random(in:20...30)
    bodyCondition.degreeOfFatigue += Int.random(in:10...20)
    bodyCondition.printCondition()
})

let longRun: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<\(longRun.name)을(를) 시작합니다.>>")
    bodyCondition.muscularEndurance += Int.random(in:20...30)
    bodyCondition.upperBodyStrength += Int.random(in:5...10)
    bodyCondition.lowerBodyMuscleStrength += Int.random(in:5...10)
    bodyCondition.degreeOfFatigue += Int.random(in:10...20)
    bodyCondition.printCondition()
})

let dynamicResting: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<\(dynamicResting.name)을(를) 시작합니다.>>")
    bodyCondition.degreeOfFatigue -= Int.random(in:5...10)
    bodyCondition.printCondition()
})


