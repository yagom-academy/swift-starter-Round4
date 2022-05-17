//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func printFitnessCenterErrorMessage(about error: FitnessCenterError) {
    print(newLineString)
    if error == .memberBeDrained {
        print("회원이 너무 힘들어서 도망갔습니다!!")
        exit(0)
    } else if error == .emptyMember {
        print("Error : empty member")
        exit(0)
    } else if error == .emptyGoalsBodyCondition {
        print("Error : empty goalsBodyCondition")
        exit(0)
    } else if error == .emptyChosenRoutine {
        print("Error : emptyChosenRoutine")
        exit(0)
    } else if error == .emptyDecidedSet {
        print("Error : emptyDecidedSet")
        exit(0)
    }
}

class FitnessCenter {
    let name: String
    var goalsBodyCondition: BodyCondition?
    var member: Person?
    var chosenRoutine: Routine?
    var decidedSet: Int?
    var routines: [Routine]
    let fitnessCenterKiosk: FitnessCenterKiosk
    
    init(name: String, routines: Routine..., kiosk: FitnessCenterKiosk) {
        self.name = name
        self.routines = routines
        fitnessCenterKiosk = kiosk
    }
    
    func startFitnessKiosk() {
        var isAchieveGoal = false
        var kioskStep = 1
        print(newLineString)
        print("안녕하세요. \(name) Fitness Center 입니다.")
        while !isAchieveGoal {
            if kioskStep == 1 {
                member = nil
                registerMember()
                if member != nil {
                    kioskStep += 1
                }
            } else if kioskStep == 2 {
                goalsBodyCondition = nil
                setGoals()
                if goalsBodyCondition != nil {
                    kioskStep += 1
                }
            } else if kioskStep == 3 {
                chosenRoutine = nil
                choseRoutine()
                if chosenRoutine != nil {
                    kioskStep += 1
                }
            } else {
                decidedSet = nil
                dicideSet()
                if decidedSet != nil {
                    do {
                        try startMemberExercise()
                        if try checkAchieveGoal() {
                            isAchieveGoal = true
                        } else {
                            kioskStep = 3
                        }
                    } catch FitnessCenterError.emptyMember {
                        printFitnessCenterErrorMessage(about: .emptyMember)
                    } catch FitnessCenterError.emptyGoalsBodyCondition {
                        printFitnessCenterErrorMessage(about: .emptyGoalsBodyCondition)
                    } catch FitnessCenterError.emptyChosenRoutine {
                        printFitnessCenterErrorMessage(about: .emptyChosenRoutine)
                    } catch FitnessCenterError.emptyDecidedSet {
                        printFitnessCenterErrorMessage(about: .emptyDecidedSet)
                    } catch FitnessCenterError.memberBeDrained {
                        printFitnessCenterErrorMessage(about: .memberBeDrained)
                    } catch {
                        print("unkown Error")
                    }
                }
            }
        }
    }
    
    func registerMember() {
        fitnessCenterKiosk.printMessageByStep(nowStep: 1)
        if let memberName = fitnessCenterKiosk.receiveEnglishName() {
            setMember(with: memberName)
        }
    }
    
    func setGoals() {
        fitnessCenterKiosk.printMessageByStep(nowStep: 2)
        if let goals = fitnessCenterKiosk.receiveGoals() {
            if goals.count == 3 {
                setGoalsBodyCondition(by: goals)
            }
        }
    }
    
    func choseRoutine() {
        chosenRoutine = nil
        fitnessCenterKiosk.printMessageByStep(nowStep: 3)
        introduceRoutines()
        if let chosenNumberOfRoutine = fitnessCenterKiosk.receiveNaturalNumber() {
            chosenRoutine = routines[chosenNumberOfRoutine-1]
        }
    }
    
    func dicideSet() {
        fitnessCenterKiosk.printMessageByStep(nowStep: 4)
        if let naturalNumber = fitnessCenterKiosk.receiveNaturalNumber() {
            decidedSet = naturalNumber
        }
    }
    
    func startMemberExercise() throws {
        guard let member = member else {
            throw FitnessCenterError.emptyMember
        }
        guard let chosenRoutine = chosenRoutine else {
            throw FitnessCenterError.emptyChosenRoutine
        }
        guard let decidedSet = decidedSet else {
            throw FitnessCenterError.emptyDecidedSet
        }
        do {
            try member.exercise(for: decidedSet, chosenRoutine)
        } catch PersonError.personBeDrained {
            throw FitnessCenterError.memberBeDrained
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
    
    func checkAchieveGoal() throws -> Bool {
        var isAchieve = false
        guard let member = member else {
            throw FitnessCenterError.emptyMember
        }
        let memberBodyCondition = member.bodyCondition
        guard let goalsBodyCondition = goalsBodyCondition else {
            throw FitnessCenterError.emptyGoalsBodyCondition
        }
        if goalsBodyCondition.upperBodyStrength <= memberBodyCondition.upperBodyStrength && goalsBodyCondition.lowerBodyStrength <= memberBodyCondition.lowerBodyStrength && goalsBodyCondition.muscleEndurance <= memberBodyCondition.muscleEndurance {
            isAchieve = true
        } else {
            isAchieve = false
        }
        printRoutineAchieveMessage(isAchieve)
        member.printMyBodyCondition()
        return isAchieve
    }
    
    func printRoutineAchieveMessage(_ isAchieve: Bool) {
        print(newLineString)
        if isAchieve {
            print("축하합니다. 목표를 달성하셨습니다! ", terminator: "")
        } else {
            print("목표치에 도달하지 못했습니다! ", terminator: "")
        }
    }
}
