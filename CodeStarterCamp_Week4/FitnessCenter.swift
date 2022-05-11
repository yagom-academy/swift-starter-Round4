//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by 황지웅 on 2022/05/07.
//

import Foundation

struct FitnessCenter {
    private var goalBodyCondition: BodyCondition?
    private var fitnessGuest: Person?
    private var routine: [Routine]
    
    private var guestRegister: GuestRegister = GuestRegister()
    
    init(goalBodyCondition: BodyCondition?,
         fitnessGuest: Person?,
         routine: [Routine]) {
        self.goalBodyCondition = goalBodyCondition
        self.fitnessGuest = fitnessGuest
        self.routine = routine
    }
    
    mutating func assignFitnessCenter() {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        fitnessGuest = guestRegister.assignPersonalInformation()
        
        print("운동 목표치를 순서대로 알려주세요. 예시) 상체근력:130,하체근력:120,근지구력:150")
        goalBodyCondition = guestRegister.assignGoalBodyCondition()
    }
    
    func exerciseSetting() {
        print("""
        몇 번째 루틴으로 운동하시겠어요?
        1. helloRoutine
        2. ohMyGodRoutine
        """)

        let routineNumber = guestRegister.assignRoutineCount(routineLength: routine.count) - 1
        
        print("몇 세트 루틴을 운동하시겠어요?")
        let setInput = guestRegister.assignSetOfRoutineCount()
        
        guard let guest = self.fitnessGuest else {
            print("운동을 할 회원님이 없습니다..")
            return
        }
        
        exerciseToGuest(guest: guest,
                        setInput: setInput,
                        routineNumber: routineNumber)
    }
    
    func exerciseToGuest(guest: Person,
                         setInput: Int,
                         routineNumber: Int) {
        let setRange = 1...setInput
        for setNumber in setRange {
            guest.exercise(for: setNumber, routine: routine[routineNumber])
            if guest.checkOverExercise() {
                print("\(guest.getName)님의 피로도가 \(guest.myFatigue)입니다. 회원이 도망갔습니다...")
                return
            }
            guard let successExercise = guest.checkGoal(goal: self.goalBodyCondition) else {
                print("목표가 없습니다.")
                return
            }
            
            if successExercise {
                print("성공입니다! 현재 \(guest.getName)님의 컨디션은 다음과 같습니다.")
                guest.printStatus()
                return
            }
        }
        print("목표치에 도달하지 못했습니다. 현재 \(guest.getName)님의 컨디션은 다음과 같습니다. ")
        guest.printStatus()
        exerciseSetting()
    }
    
    mutating func run() {
        assignFitnessCenter()
        exerciseSetting()
    }
}
