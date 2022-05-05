//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/06.
//

import Foundation

class FitnessCenter {
    let targetBodyCondition: BodyCondition? = nil
    var member: Person? = nil
    var routineList: [Routine]
    
    init(routineList: [Routine]) {
        self.routineList = routineList
    }
    
    func open() {
        enroll()
        setTargetCondition()
    }
    
    func enroll() {
        
    }
    
    func setTargetCondition() {
        
    }
    
    func selectRoutine() {
        
    }
}
