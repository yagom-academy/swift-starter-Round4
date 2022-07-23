//
//  WEEK4 STEP1.swift
//  CodeStarterCamp_Week4
//
//  Created by oh namjun on 2022/07/19.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

class BodyCondition {
    var upperBodyStrengh: Int {
        didSet {
            print("상체근력이 \(showChangeValueMessage(self.upperBodyStrengh - oldValue))")
        }
    }
    var lowerBodyStrengh: Int {
        didSet {
            print("하체근력이 \(showChangeValueMessage(self.lowerBodyStrengh - oldValue))")
        }
    }
    var muscularEndurance: Int {
        didSet {
            print("근지구력이 \(showChangeValueMessage(self.muscularEndurance - oldValue))")
        }
    }
    var fatigue: Int {
        didSet {
            print("피로도가 \(showChangeValueMessage(self.fatigue - oldValue))")
        }
    }
    
    init(upperBodyStrengh: Int, lowerBodyStrengh: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrengh = upperBodyStrengh
        self.lowerBodyStrengh = lowerBodyStrengh
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }

    func showChangeValueMessage(_ changeValue: Int) -> String {
        let changeValueMessage: String
        
        if changeValue > 0 {
            changeValueMessage = "\(changeValue) 상승합니다."
        } else if changeValue < 0 {
            changeValueMessage = "\(changeValue) 하락합니다."
        } else {
            changeValueMessage = "변화 없습니다."
        }
        
        return "\(changeValueMessage)"
    }
    
    func checkCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrengh)")
        print("하체근력: \(lowerBodyStrengh)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigue)")
        print("--------------")
    }
}

func moveExercise(_ activity: Activity, _ bodyCondition: BodyCondition) {
    activity.action(bodyCondition)
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: {
    print("<<\(sitUp.name)을(를) 시작합니다>>")
    
    $0.upperBodyStrengh += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
})

let squat: Activity = Activity(name: "스쿼트", action: {
    print("<<\(squat.name)(를) 시작합니다>>")
    
    $0.lowerBodyStrengh += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
})

let longRun: Activity = Activity(name: "오래달리기", action: {
    print("<<\(longRun.name)(를) 시작합니다>>")
    
    $0.upperBodyStrengh += Int.random(in: 5...10)
    $0.lowerBodyStrengh += Int.random(in: 5...10)
    $0.muscularEndurance += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 20...30)
})

let rest: Activity = Activity(name: "휴식", action: {
    print("<<\(rest.name)(를) 시작합니다>>")
    
    $0.fatigue -= Int.random(in: 20...30)
})

struct Routine {
    let routineName: String
    let activities: Array<Activity>
}

enum ActivityError: Error {
    case wrongValue
    case notPositiveInteger
    case excessiveFatigue
}

func startRoutine() throws {
    print("루틴을 몇 번 반복할까요?")
    let input: String! = readLine()
    
    guard let intOfInput = Int(input) else {
        throw ActivityError.wrongValue
    }
    
    if intOfInput < 1 {
        throw ActivityError.notPositiveInteger
    }
    
    print("--------------")
    
    for count in 1...intOfInput {
        print("\(count) 번째 \(routine.routineName)을(를) 시작합니다.")
    
        for sizecount in 0...routine.activities.count - 1 {
            moveExercise(routine.activities[sizecount], NamJunBodyConditionw)
    
            print("--------------")
            
            if NamJunBodyConditionw.fatigue > 100 {
                throw ActivityError.excessiveFatigue
            }
        }
    }
    NamJunBodyConditionw.checkCondition()
}
