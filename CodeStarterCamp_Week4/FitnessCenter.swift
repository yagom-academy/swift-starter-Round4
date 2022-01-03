//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 조민호 on 2021/12/29.
//

import Foundation

final class FitnessCenter {
    private(set) var goalsBodyCondition: BodyCondition?
    private(set) var member: Person? = nil
    private(set) var bodyCondition: BodyCondition
    let routineList: [Routine]
    let inputView: InputView
    let resultView: ResultView
    
    init(bodyCondition: BodyCondition,
         routineList: [Routine],
         inputView: InputView,
         resultView: ResultView) {
        self.bodyCondition = bodyCondition
        self.routineList = routineList
        self.inputView = inputView
        self.resultView = resultView
    }
    
    func startFitnessProcess() {
        do {
            try registerFitness()
            try startRoutine()
        } catch InputError.valueIsNil {
            self.startFitnessProcess()
        } catch InputError.valueIsEmpty {
            self.startFitnessProcess()
        } catch InputError.valueMustPositiveNumber {
            self.startFitnessProcess()
        } catch InputError.valueMustConvertToInt {
            self.startFitnessProcess()
        } catch FitnessError.noMember {
            try? self.startRoutine()
        } catch FitnessError.noGoals {
            try? self.startRoutine()
        } catch FitnessError.fatigueFull {
            try? self.startRoutine()
        } catch FitnessError.failToReachGoals {
            try? self.startRoutine()
        } catch {}
    }
    
    private func registerFitness() throws {
        let nameOfMember = try inputView.inputNameOfMember()
        self.member = Person(name: nameOfMember, bodyCondition: bodyCondition)
        let goalsBodyCondition = try inputView.inputGolasBodyCondition()
        self.goalsBodyCondition = BodyCondition(upperBodyStrength: goalsBodyCondition[0],
                                                lowerBodyStrength: goalsBodyCondition[1],
                                                muscularEndurance: goalsBodyCondition[2],
                                                fatigue: 0)
    }
    
    private func startRoutine() throws {
        let routineOrder = try inputView.inputRoutineOrder(routineList: self.routineList)
        let repeatSeveralSet = try inputView.inputRoutineRepeatSet()
        
        try self.member?.exercise(for: repeatSeveralSet, routine: self.routineList[routineOrder])
        try compareGolasAndCurrentCondition()
    }
    
    private func compareGolasAndCurrentCondition() throws {
        guard let member = member else {
            throw FitnessError.noMember
        }
        
        guard let goalsBodyCondition = goalsBodyCondition else {
            throw FitnessError.noGoals
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
