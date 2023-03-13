//
//  body.swift
//  CodeStarterCamp_Week4
//
//  Created by minsong kim on 2023/03/13.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet {
            print("상체근력이 \(upperBodyStrength - oldValue)만큼 상승합니다.")
        }
    }
    var lowerBodyStrength: Int {
        didSet {
            print("하체근력이 \(lowerBodyStrength - oldValue)만큼 상승합니다.")
        }
    }
    var muscularEndurance: Int {
        didSet {
            print("근지구력이 \(muscularEndurance - oldValue)만큼 상승합니다.")
        }
    }
    var fatigability: Int {
        didSet {
            if fatigability > oldValue {
                print("피로도가 \(fatigability - oldValue)만큼 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigability)만큼 줄어듭니다.")
            }
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigability: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigability = fatigability
    }
    
    func conditionCheck() {
        print(
        """
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBodyStrength)
        하체근력: \(lowerBodyStrength)
        근지구력: \(muscularEndurance)
        피로도: \(fatigability)
        --------------
        """
        )
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { bodycondition in
    print("<<\(윗몸일으키기.name)을(를) 시작합니다.>>")
    bodycondition.upperBodyStrength += Int.random(in: 10...20)
    bodycondition.fatigability += Int.random(in: 10...20)
    bodycondition.conditionCheck()
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<\(스쿼트.name)을(를) 시작합니다.>>")
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigability += Int.random(in: 10...20)
    bodyCondition.conditionCheck()
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<\(오래달리기.name)을(를) 시작합니다.>>")
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.fatigability += Int.random(in: 20...30)
    bodyCondition.conditionCheck()
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<\(동적휴식.name)을(를) 시작합니다.>>")
    bodyCondition.fatigability -= Int.random(in: 5...10)
    bodyCondition.conditionCheck()
})

