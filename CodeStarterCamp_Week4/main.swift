//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func printLine(length: Int) {
    let line: String = String(repeating: "-", count: length)
    print(line)
}

// 2. Activity 타입을 활용해 다양한 활동 인스턴스를 생성합니다.
struct Activity {
    var name: String
    let action: (BodyCondition) -> Void
}

// 3. Activity 타입의 객체를 생성하고, action 클로저를 호출해 활동을 진행해봅시다
var activity: Activity = Activity(name: "", action: { bodyCondition in
    guard let type: ActivityType = ActivityType.getActivity(from: activity.name) else {
        return
    }
    bodyCondition.enhanceMuscle(activityType: type)
})

let bodyCondition: BodyCondition = BodyCondition()
for _ in 1...5 {
    if let randomActivity: ActivityType = ActivityType.allCases.randomElement() {
        let name: String = randomActivity.name
        activity.name = name
        activity.action(bodyCondition)
        
        // 4. 활동 후 현재의 몸 컨디션을 확인할 수 있는 메서드를 호출합니다.
        bodyCondition.currentCondition()
    }
}
