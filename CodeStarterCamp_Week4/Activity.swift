//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by Dean on 2023/03/23.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    func start(bodyCondition: BodyCondition) {
        print("<<\(name)을(를) 시작합니다>>")
        action(bodyCondition)
        bodyCondition.checkBodyCondition()
    }
}
