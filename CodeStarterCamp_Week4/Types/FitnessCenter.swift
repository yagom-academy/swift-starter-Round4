//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by Jungmo Yu on 2022/01/01.
//

import Foundation

class FitnessCenter {
    var name: String
    var upperBodyTargetCondition: Int = 0
    var lowerBodyTargetCondition: Int = 0
    var muscularEnduranceTargetCondition: Int = 0
    var member: Person? = nil
    var routines: [Routine] = [hellRoutine, tabataRoutine, refresh]
    var selectedRoutineIndex: Int = 0
    var numOfSet: UInt = 0
    
    init(name: String) {
        self.name = name
    }
    
    func startTraining() throws {
        guard member != nil else { throw FitnessError.NoMember }
        greeting()
        askTargetCondition()
        askForSelectRoutine()
    }
    
    func greeting() {
        print("안녕하세요. \(self.name) 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        saveMemberName()
    }
    
    func askTargetCondition() {
        print("운동 목표치를 순서대로 알려주세요.")
        do {
            try saveTargetCondition()
        } catch FitnessError.TargetConditionOutOfRange {
            print("모든 목표치는 0보다 커야합니다.")
            return
        } catch {}
    }
    
    func askForSelectRoutine() {
        print("몇 번째 루틴으로 운동하시겠어요?")
        for (routineNum, routine) in self.routines.enumerated() {
            print("\(routineNum + 1). \(routine.name)")
        }
        do {
            try saveRoutineIndex()
        } catch FitnessError.RoutineOufOfRange {
            print("루틴의 번호가 올바르지 않습니다.")
            return
        } catch {}
        
        askNumOfSet()
    }
    
    func checkTrainingStatus() throws {
        guard let notNilMember = self.member else { throw FitnessError.NoMember }
        
        guard notNilMember.bodyCondition.upperBodyStrength > self.upperBodyTargetCondition
                && notNilMember.bodyCondition.lowerBodyStrength > self.lowerBodyTargetCondition
                && notNilMember.bodyCondition.muscularEndurance > self.muscularEnduranceTargetCondition
        else { throw FitnessError.CouldNotReachedTarget }
        
        print("성공입니다! 현재 \(notNilMember.name)님의 컨디션은 다음과 같습니다.")
        notNilMember.bodyCondition.printBodyCondition()
    }
        
    func saveMemberName() {
        guard let name = readLine() else { return }
        self.member = Person(name: name)
    }
    
    func saveRoutineIndex() throws {
//        guard let routineIndexString = readLine() else { return }
//        guard let routineIndexInt = Int(routineIndexString) else { return }
        guard let routineIndexString = readLine(),
              let routineIndexInt = Int(routineIndexString) else { return }
        
        guard routineIndexInt <= routines.count && routineIndexInt > 0 else { throw FitnessError.RoutineOufOfRange }
        self.selectedRoutineIndex = routineIndexInt - 1
    }
    
    func saveTargetCondition() throws {
        print("상체 근력:", terminator: " ")
        guard let upperBodyMuscleTargetConditionString = readLine() else { return }
        print("하체 근력:", terminator: " ")
        guard let lowerBodyMuscleTargetConditionString = readLine() else { return }
        print("근지구력:", terminator: " ")
        guard let muscularEnduranceTargetConditionString = readLine() else { return }
        
        guard let upperBodyMuscleTargetCondition = Int(upperBodyMuscleTargetConditionString),
              let lowerBodyMuscleTargetCondition = Int(lowerBodyMuscleTargetConditionString),
              let muscularEnduranceTargetCondition = Int(muscularEnduranceTargetConditionString) else { return }
        
        guard upperBodyMuscleTargetCondition > 0
                && lowerBodyMuscleTargetCondition > 0
                && muscularEnduranceTargetCondition > 0 else { throw FitnessError.TargetConditionOutOfRange }
        
        self.upperBodyTargetCondition = upperBodyMuscleTargetCondition
        self.lowerBodyTargetCondition = lowerBodyMuscleTargetCondition
        self.muscularEnduranceTargetCondition = muscularEnduranceTargetCondition
    }
    
    func saveNumOfSet() throws {
        guard let numOfSetString = readLine() else { return }
        guard let numOfSetInt = UInt(numOfSetString) else { return }
        guard numOfSetInt > 0 else { throw FitnessError.NumOfSetOutOfRange }
        self.numOfSet = numOfSetInt
        try makePersonExercise()
    }
    
    func checkMemberNil() throws {
        guard self.member != nil else { throw FitnessError.NoMember }
    }
    
    func makePersonExercise() throws {
        guard let notNilMember = self.member else { return }
        do {
            try checkMemberNil()
            try notNilMember.exercise(for: Int(self.numOfSet),
                                     routine: self.routines[self.selectedRoutineIndex])
            try checkTrainingStatus()
        } catch FitnessError.HighFatigue {
            print("\(notNilMember.name)의 피로도가 \(notNilMember.bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
        } catch FitnessError.CouldNotReachedTarget {
            print("목표치에 도달하지 못했습니다. 현재 \(notNilMember.name)님의 컨디션은 다음과 같습니다.")
            notNilMember.bodyCondition.printBodyCondition()
            print("--------------")
            self.askForSelectRoutine()
        } catch {}
    }
    
    func askNumOfSet() {
        print("몇 세트 반복하시겠어요?")
        do{
            try saveNumOfSet()
        } catch FitnessError.NumOfSetOutOfRange {
            print("세트 수는 0보다 커야합니다.")
            return
        } catch {}
    }
    
}
