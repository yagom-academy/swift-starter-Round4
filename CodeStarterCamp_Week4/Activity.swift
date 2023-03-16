//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by tom on 2023/03/14.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    init(name: String, action: @escaping (BodyCondition) -> Void) {
        self.name = name
        self.action = action
    }
    
    static func exerciseStart(activity: Activity, bodyCondition: BodyCondition) {
        print("<<\(activity.name)을(를) 시작합니다.>>")
        (activity.action(bodyCondition))
    }
}
