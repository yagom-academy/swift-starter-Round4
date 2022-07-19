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
        didSet(oldValue) {
            print("상체근력이 \(self.upperBodyStrengh - oldValue) 상승합니다.")
        }
    }
    var lowerBodyStrengh: Int {
        didSet(oldValue) {
            print("하체근력이 \(self.lowerBodyStrengh - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance: Int {
        didSet(oldValue) {
            print("근지구력이 \(self.muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigue: Int {
        didSet(oldValue) {
            print("피로도가 \(self.fatigue - oldValue) 상승합니다.")
        }
    }
    
    init(_ upperBodyStrengh: Int, _ lowerBodyStrengh: Int, _ muscularEndurance: Int, _ fatigue: Int){
        self.upperBodyStrengh = upperBodyStrengh
        self.lowerBodyStrengh = lowerBodyStrengh
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }

    func checkCondition() {
        print("--------------")
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

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: {
    print("<<\(윗몸일으키기.name)을(를) 시작합니다>>")
    
    $0.upperBodyStrengh += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
    
    $0.checkCondition()
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: {
    print("<<\(스쿼트.name)(를) 시작합니다>>")
    
    $0.lowerBodyStrengh += Int.random(in: 10...20)
    $0.fatigue += Int.random(in: 10...20)
    
    $0.checkCondition()
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: {
    print("<<\(오래달리기.name)(를) 시작합니다>>")
    
    $0.upperBodyStrengh += Int.random(in: 5...10)
    $0.lowerBodyStrengh += Int.random(in: 5...10)
    $0.muscularEndurance += Int.random(in: 20...30)
    $0.fatigue += Int.random(in: 20...30)
    
    $0.checkCondition()
})

let 휴식: Activity = Activity(name: "휴식", action: {
    print("<<\(휴식.name)(를) 시작합니다>>")
    
    $0.fatigue += Int.random(in: 20...30)
    
    $0.checkCondition()
})
