//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FitnessCenter {
    let name: String
    var goalsBodyCondition: BodyCondition?
    let bodyConditionProperty = ["UpperBodyStrength", "LowerBodyStrength", "MuscleEndurance"]
    var member: Person?
    var routines: [Routine]
    let fitnessCenterKiosk = FitnessCenterKiosk()
    
    init(name: String, routines: Routine...) {
        self.name = name
        self.routines = routines
    }
    
    func startFitnessKiosk() {
        var isAchieveGoal = false
        var kioskStep = 1
        var chosenRoutine: Routine?
        print(newLineString)
        print("안녕하세요. \(name) Fitness Center 입니다.")
        while !isAchieveGoal {
            if kioskStep == 1 {
                fitnessCenterKiosk.printMessageByStep(nowStep: kioskStep)
                if let memberName = fitnessCenterKiosk.receiveEnglishName() {
                    setMember(with: memberName)
                    kioskStep += 1
                    continue
                }
            } else if kioskStep == 2 {
                var goals = [Int]()
                fitnessCenterKiosk.printMessageByStep(nowStep: kioskStep)
                while goals.count < 3 {
                    print("\(bodyConditionProperty[goals.count]) 목표치.")
                    let naturalNumber = fitnessCenterKiosk.receiveNaturalNumber()
                    goals.append(naturalNumber)
                }
                if goals.count == 3 {
                    setGoalsBodyCondition(by: goals)
                    kioskStep += 1
                    continue
                }
            } else if kioskStep == 3 {
                chosenRoutine = nil
                fitnessCenterKiosk.printMessageByStep(nowStep: kioskStep)
                introduceRoutines()
                let chosenNumberOfRoutine = fitnessCenterKiosk.receiveNaturalNumber()
                chosenRoutine = routines[chosenNumberOfRoutine-1]
                if chosenRoutine != nil {
                    kioskStep += 1
                    continue
                }
            } else {
                fitnessCenterKiosk.printMessageByStep(nowStep: kioskStep)
                let chosenNumberOfSet = fitnessCenterKiosk.receiveNaturalNumber()
                if let chosenRoutine = chosenRoutine {
                    let routineResult = repeatRoutine(chosenRoutine, times: chosenNumberOfSet)
                    switch routineResult {
                    case .success(let isAchieve):
                        printRoutineAchieveMessage(isAchieve)
                        if isAchieve {
                            isAchieveGoal = true
                        } else {
                            kioskStep = 3
                        }
                    case .failure(let error):
                        printFitnessCenterErrorMessage(about: error)
                    }
                }
            }
        }
    }
    
    func setMember(with name: String) {
        member = Person(name: name, bodyCondition: BodyCondition(upperBodyStrength: 30, lowerBodyStrength: 30, muscleEndurance: 10))
    }
    
    func setGoalsBodyCondition(by goals: [Int]) {
        goalsBodyCondition = BodyCondition(upperBodyStrength: goals[0], lowerBodyStrength: goals[1], muscleEndurance: goals[2])
    }
    
    func introduceRoutines() {
        for routineCount in 1...routines.count {
            print("\(routineCount). \(routines[routineCount-1].name)")
        }
    }

    func repeatRoutine(_ routine: Routine, times: Int) -> Result<Bool, FitnessCenterError> {
        if let member = member {
            if member.exercise(for: times, routine) {
                let checkGoalsResult = checkGoals(target: member.bodyCondition)
                switch checkGoalsResult {
                case .success(let isAchieve):
                    if isAchieve {
                        return .success(true)
                    } else {
                        return .success(false)
                    }
                case .failure(let error):
                    return .failure(error)
                }
            } else {
                return .failure(.memberBeDrained)
            }
        } else {
            return .failure(.emptyMember)
        }
    }
    
    func checkGoals(target bodyCondition: BodyCondition) -> Result<Bool, FitnessCenterError> {
        if let goalsBodyCondition = goalsBodyCondition {
            if goalsBodyCondition.upperBodyStrength <= bodyCondition.upperBodyStrength && goalsBodyCondition.lowerBodyStrength <= bodyCondition.lowerBodyStrength && goalsBodyCondition.muscleEndurance <= bodyCondition.muscleEndurance {
                return .success(true)
            } else {
                return .success(false)
            }
        }
        return .failure(.emptyGoalsBodyCondition)
    }
    
    func printRoutineAchieveMessage(_ isAchieve: Bool) {
        print(newLineString)
        if isAchieve {
            print("축하합니다. 목표를 달성하셨습니다! ", terminator: "")
        } else {
            print("목표치에 도달하지 못했습니다! ", terminator: "")
        }
        member?.printMyBodyCondition() ?? printFitnessCenterErrorMessage(about: .emptyMember)
    }
}
