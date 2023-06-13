//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by 이지원 on 2023/06/09.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    init(name: String, action: @escaping (BodyCondition) -> Void) {
        self.name = name
        self.action = { bodyCondition in
            print("\(name)을(를) 시작합니다.")
            action(bodyCondition)
            bodyCondition.showMyBodyCondition()
        }
    }
}
