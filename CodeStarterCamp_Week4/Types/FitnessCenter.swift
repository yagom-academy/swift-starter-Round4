//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by Jungmo Yu on 2022/01/01.
//

import Foundation

class FitnessCenter {
    var name: String
    var upperBodyTargetCondition: UInt
    var lowerBodyTargetCondition: UInt
    var muscularEnduranceTargetCondition: UInt
    var member: Person?
    var routines: [Routine]
    var selectedRoutineIndex: Int
    var numOfSet: UInt
    
    init(name: String = "",
         upperBodyTargetCondition: UInt = 0,
         lowerBodyTargetCondition: UInt = 0,
         muscularEnduranceTargetCondition: UInt = 0,
         member: Person? = nil,
         routines: [Routine] = [hellRoutine, tabataRoutine, refresh],
         selectedRoutineIndex: Int = 0,
         numOfSet: UInt = 0)
    {
        self.name = name
        self.upperBodyTargetCondition = upperBodyTargetCondition
        self.lowerBodyTargetCondition = lowerBodyTargetCondition
        self.muscularEnduranceTargetCondition = muscularEnduranceTargetCondition
        self.member = member
        self.routines = routines
        self.selectedRoutineIndex = selectedRoutineIndex
        self.numOfSet = numOfSet
    }
    
    func startTraining() throws {
        greeting()
        askTargetCondition()
        askForSelectRoutine()
        askNumOfSet()
        guard let notNilMember = self.member else { throw FitnessError.NoMember }
        notNilMember.exercise(for: Int(self.numOfSet),
                                 routine: self.routines[self.selectedRoutineIndex])
    }
        
    func saveMemberName() {
        guard let name = readLine() else { return }
        self.member = Person(name: name, bodyCondition: BodyCondition())
    }
    
    func saveRoutineIndex() throws {
        guard let routineIndexString = readLine() else { return }
        guard let routineIndexInt = Int(routineIndexString) else { return }
        guard routineIndexInt <= routines.count && routineIndexInt > 0 else { throw FitnessError.RoutineOufOfRange }
        self.selectedRoutineIndex = routineIndexInt
    }
    
    func saveTargetCondition() throws {
        print("상체 근력:", terminator: " ")
        guard let upperBodyMuscleTargetConditionString = readLine() else { return }
        print("하체 근력:", terminator: " ")
        guard let lowerBodyMuscleTargetConditionString = readLine() else { return }
        print("근지구력:", terminator: " ")
        guard let muscularEnduranceTargetConditionString = readLine() else { return }
        
        guard let upperBodyMuscleTargetCondition = UInt(upperBodyMuscleTargetConditionString),
              let lowerBodyMuscleTargetCondition = UInt(lowerBodyMuscleTargetConditionString),
              let muscularEnduranceTargetCondition = UInt(muscularEnduranceTargetConditionString) else { return }
        
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
    }
    
    func askNumOfSet() {
        print("몇 세트 반복하시겠어요?")
        do{
            try saveNumOfSet()
        } catch FitnessError.NumOfSetOutOfRange {
            print("세트 수는 0보다 커야합니다.")
            return
        }
        catch {}
    }
    
}
