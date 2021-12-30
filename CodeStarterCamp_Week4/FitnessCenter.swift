//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 조민호 on 2021/12/29.
//

import Foundation

final class FitnessCenter {
    let goalsBodyCondition: BodyCondition
    let member: Person?
    let routineList: [Routine]
    
    init(goalsBodyCondition: BodyCondition, member: Person, routineList: [Routine]) {
        self.goalsBodyCondition = goalsBodyCondition
        self.member = member
        self.routineList = routineList
    }
    
    func start() throws {
        let inputView = InputView()
        let routineOrder = try inputView.inputRoutineOrder(routineList: self.routineList)
        let repeatSeveralSet = try inputView.inputRoutineRepeatSet()
        
        try self.member?.exercise(for: repeatSeveralSet, routine: self.routineList[routineOrder])
        try compareGolasAndCurrentCondition()
    }
    
    private func compareGolasAndCurrentCondition() throws {
        guard let member = member else {
            return
        }
        
        guard member.bodyCondition.upperBodyStrength > goalsBodyCondition.upperBodyStrength else {
            throw FitnessError.failToReachGoals
        }
        
        guard member.bodyCondition.lowerBodyStrength > goalsBodyCondition.lowerBodyStrength else {
            throw FitnessError.failToReachGoals
        }
        
        guard member.bodyCondition.muscularEndurance > goalsBodyCondition.muscularEndurance else {
            throw FitnessError.failToReachGoals
        }
    }
}
