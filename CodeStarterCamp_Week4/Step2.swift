//
//  Step2.swift
//  CodeStarterCamp_Week4
//
//  Created by 지상률 on 2022/03/10.
//

import Foundation
enum FitnessProcessError: Error {
    case overFatigue
    case noMembers
    case needMoreExercies
    case goalConditionOutOfRange
}



class BodyCondition {
    var upperBody: Int
    var lowerBody: Int
    var endurance: Int
    var fatigue: Int
    
    init() {
        self.upperBody = 0
        self.lowerBody = 0
        self.endurance = 0
        self.fatigue = 0
    }
    
    init(upperBody: Int, lowerBody: Int, endurance: Int, fatigue: Int) {
        self.upperBody = upperBody
        self.lowerBody = lowerBody
        self.endurance = endurance
        self.fatigue = fatigue
    }
    
    func showBodyCondition() {
        print("상체근력 :\(upperBody)")
        print("하체근력 :\(lowerBody)")
        print("근지구력 :\(endurance)")
        print("피로도 :\(fatigue)")
    }
}

var Body = BodyCondition(upperBody: 0, lowerBody: 0, endurance: 0, fatigue: 0)
var targetBodyCondition = BodyCondition(upperBody: 0, lowerBody: 0, endurance: 0, fatigue: 0)

//운동 타입
struct Exercise {
    let name: String
    let action: () -> Void
}

struct Routine {
    var name: String = "3분할 중 첫번째 Routine"
    var exercises: Array = [pushUp ,
                             sitUp ,
                             activeRest ]
}

class Person{
    var name: String
    var bodyCondition: BodyCondition = Body
    
    init() {
        self.name = "JeeSangRyul"
    }
    init(name:String) {
        self.name = name
    }
    
    func exercise(set: Int, routine: Routine) {
        for setNumber in 1...set {
            print("------------------------")
            print("\(routine.name) \(setNumber)Set를 시작하겠습니다.")
            for exercises in routine.exercises {
                print(exercises.name)
                exercises.action() //exercises안에 있는 클로져 실행
            }
        }
    }
}

let sitUp: Exercise = Exercise(name: "윗몸일으키기") {
    someOne.bodyCondition.upperBody += Int.random(in: 10...20)
    someOne.bodyCondition.fatigue += Int.random(in: 10...15)
}
let squat: Exercise = Exercise(name: "스쿼트") {
    someOne.bodyCondition.lowerBody += Int.random(in: 20...30)
    someOne.bodyCondition.fatigue += Int.random(in: 10...15)
}
let pushUp: Exercise = Exercise(name: "팔굽혀피기") {
    someOne.bodyCondition.upperBody += Int.random(in: 10...20)
    someOne.bodyCondition.fatigue += Int.random(in: 10...15)
}
let shuttleRun : Exercise = Exercise(name: "오래달리기") {
    someOne.bodyCondition.endurance += Int.random(in: 20...30)
    someOne.bodyCondition.upperBody += Int.random(in: 5...10)
    someOne.bodyCondition.lowerBody += Int.random(in: 5...10)
    someOne.bodyCondition.fatigue += Int.random(in: 15...20)
}
let deadLift : Exercise = Exercise(name: "데드리프트") {
    someOne.bodyCondition.upperBody += Int.random(in: 5...10)
    someOne.bodyCondition.fatigue += Int.random(in: 10...15)
}
let activeRest : Exercise = Exercise(name: "동적휴식") {
    someOne.bodyCondition.fatigue -= Int.random(in: 5...10)
}

var firstRoutine: Routine = Routine(name: "3분할 중 첫번째 Routine", exercises: [pushUp, sitUp, activeRest])

var secoundRoutine: Routine = Routine(name: "3분할 중 두번째 Routine", exercises: [deadLift, sitUp, activeRest])

var thirdRoutine: Routine = Routine(name: "3분할 중 세번째 Routine", exercises: [squat, sitUp, shuttleRun, activeRest])

var routineArray: [Routine] = [firstRoutine, secoundRoutine, thirdRoutine]



class FitnessCenter {
    var member: String?
    var goalBodyCondition: BodyCondition = targetBodyCondition
    var totalRoutine: [Routine] = routineArray
    
    
    //이름을 입력받아 저장하는 매소드
    // member에 입력값을 받아서 nil일 경우 아래로 타지않고 거기서 멈추는 로직이다.
    func inputMemberName() {
        self.member = readLine()
        guard let memberName = self.member else { return }
        someOne.name = memberName
    }
    
    //저장받은 member가 nil인 경우 error를 반환해주는 메소드
    //inputMemberName이라는 함수를 실행하고 someOne.name이 빈 값이라면 error를 던져주는 구문이다.
    func saveMemeberName() throws {
        print("안녕하세요. 야곰 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        inputMemberName()
        
        // != nil은 아예 값이 없어야하기 때문에 다루기 어려웠다. 그래서 아무것도 없는 Empty를 한다면 보다 보편적인 상황을 막을수있다고 생각했다.
        guard someOne.name.isEmpty == false else {
            throw FitnessProcessError.noMembers
        }
    }
    
    
    //회원의 오늘 goalbodycondition을 입력받는다.
    //입력값을 연속으로 세개를 받아서 array로 만들어준다음 goalBodyCondition에 각각 Int로 할당해주는 로직이다.
    //목적치가 -일 경우 error를 던져준다.
    func inputGoalBodyCondition() throws {
        print("운동 목표치를 순서대로 알려주세요. 예시) 상체근력: 130, 하체근력: 120, 근지구력: 150")
        let inputBodycondition =  readLine()
        if let inputBodycondition = inputBodycondition {
            let array = inputBodycondition.components(separatedBy: " ")
            if let goalUpperBody = Int(array[0]),
               let goalLowerBody = Int(array[1]),
               let goalEndurance = Int(array[2]) {
                goalBodyCondition.upperBody = goalUpperBody
                goalBodyCondition.lowerBody = goalLowerBody
                goalBodyCondition.endurance = goalEndurance
                guard goalBodyCondition.upperBody >= 0
                        && goalBodyCondition.lowerBody >= 0
                        && goalBodyCondition.endurance >= 0 else {
                            throw FitnessProcessError.goalConditionOutOfRange
                        }
            }
        }
    }
    
    
    func showTotalRoutine() {
        print("몇 번째 루틴으로 운동하시겠어요?")
        var index: Int = 0
        for (routineName) in totalRoutine {
            index += 1
            print("\(index): \(routineName.name)")
            
        }
    }
    

    //만약 피로도가 100을 넘거나 목표치를 못채웠다면 error가 던져진다.
    func inputRoutineAndSet() throws {
        showTotalRoutine()
        let routineNumber: String? = readLine()
        if let routinenumber = Int(routineNumber ?? "0") {
            if routinenumber == 1 {
                print("몇 세트 반복하시겠어요?")
                let routineSet: String? = readLine()
                if let routineSet = Int(routineSet ?? "0") {
                    someOne.exercise(set: routineSet, routine: firstRoutine)
                    
                    guard someOne.bodyCondition.fatigue <= 100 else {
                        throw FitnessProcessError.overFatigue
                    }
                }
            }else if routinenumber == 2 {
                print("몇 세트 반복하시겠어요?")
                let routineSet: String? = readLine()
                if let routineSet = Int(routineSet ?? "0") {
                    someOne.exercise(set: routineSet, routine: secoundRoutine)
                    
                    guard someOne.bodyCondition.fatigue <= 100 else {
                        throw FitnessProcessError.overFatigue
                    }
                }
            } else if routinenumber == 3 {
                print("몇 세트 반복하시겠어요?")
                let routineSet: String? = readLine()
                if let routineSet = Int(routineSet ?? "0") {
                    someOne.exercise(set: routineSet, routine: thirdRoutine)
                    
                    guard someOne.bodyCondition.fatigue <= 100 else {
                        throw FitnessProcessError.overFatigue
                    }
                }
            }
            guard goalBodyCondition.upperBody <= someOne.bodyCondition.upperBody else {
                throw FitnessProcessError.needMoreExercies
            }
            guard goalBodyCondition.lowerBody <= someOne.bodyCondition.lowerBody else {
                throw FitnessProcessError.needMoreExercies
            }
            guard goalBodyCondition.endurance <= someOne.bodyCondition.endurance else {
                throw FitnessProcessError.needMoreExercies
            }
        }
    }
    
    //위에서 던진 모든 error를 해결해주는 함수이다.
    //함수에서 직접 error를 처러해주는 형식이 좀더 좋아보인다.
    func membersExercies() throws {
        do{
            try saveMemeberName()
            print("현재 \(someOne.name)님의 \(someOne.bodyCondition.showBodyCondition())컨디션입니다.")
            try inputGoalBodyCondition()
            print("\(someOne.name)님이 입력하신 목표치는 상체근력: \(goalBodyCondition.upperBody), 하체근력: \(goalBodyCondition.lowerBody) , 근지구력: \(goalBodyCondition.endurance)입니다.")
            try inputRoutineAndSet()
            
            print("------------------------")
            print("성공입니다! 현재 \(someOne.name)님의 컨디션은 다음과 같습니다.")
            someOne.bodyCondition.showBodyCondition()
        } catch FitnessProcessError.noMembers {
            print("회원의 이름이 없습니다. 처음부터 다시 진행해주세요.")
            return
        } catch FitnessProcessError.goalConditionOutOfRange {
            print("목표치를 0보다 작게 입력할 수 없습니다. 처음부터 다시 진행해주세요.")
            return
        } catch FitnessProcessError.overFatigue {
            print("------------------------")
            print("\(someOne.name)님의 피로도가 \(someOne.bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
            return
        } catch FitnessProcessError.needMoreExercies {
            print("------------------------")
            print("목표치에 도달하지 못했습니다. 현재 \(someOne.name)님의 컨디션은 다음과 같습니다.")
            someOne.bodyCondition.showBodyCondition()
            print("------------------------")
            try inputRoutineAndSet()
            print("성공입니다! 현재 \(someOne.name)님의 컨디션은 다음과 같습니다.")
            someOne.bodyCondition.showBodyCondition()
        } catch{
            print(error)
        }
    }
}


