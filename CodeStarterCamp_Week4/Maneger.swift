//
//  Maneger.swift
//  CodeStarterCamp_Week4
//
//  Created by minsong kim on 2023/03/15.
//

import Foundation

class Manager {
    var member: BodyCondition
    var routine: Routine
    
    init(member: BodyCondition, routine: Routine) {
        self.member = member
        self.routine = routine
    }
    
    func setRoutine() {
        routine.round(member, from: self)
    }
    
    func exercise(round: Int) {
    outLoop: for number in 1...round {
        print("\(number) 번째 \(routine.name)을 시작합니다.")
        for activity in routine.activities {
            activity.action(member)
            print("--------------")
            do {
                try member.fatigabilityCheck()
            } catch Errors.maxFatigability {
                print("피로도가 100 이상입니다. 루틴을 중단합니다.")
                member.conditionCheck()
                break outLoop
            } catch {}
            
        }
    }
    }
}
