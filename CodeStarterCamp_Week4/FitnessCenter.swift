//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by mingmac on 2022/05/10.
//

import Foundation

class FitnessCenter {
    let centerName: String
    var goalBodyCondition: BodyCondition = BodyCondition(upperBodyMuscleStrength: 0, lowerBodyMuscleStrength: 0, muscularEndurance: 0, tiredness: 0)
    var member: Person?
    let routineList: [Routine]
    
    init(centerName: String, routineList: [Routine]) {
        self.centerName = centerName
        self.routineList = routineList
    }
    
    func inputToInt() throws -> Int {
        guard let inputInt = readLine(), let inputInt = Int(inputInt) else {
            throw InputError.notInt
        }
        return inputInt
    }
    
    func inputToString() throws -> String {
        guard let inputName = readLine(), inputName.isEmpty == false, inputName.contains(" ") == false else {
            throw InputError.notString
            }
        for inputValue in inputName {
            guard inputValue.isLetter else {
                throw InputError.notString
            }
        }
        return inputName
    }
    
    func proceedExercise() throws {
        if let member = member {
            while true {
                do {
                    try member.exercise(routineArray: chooseRountine(from: routineList), for: setCountOfRoutine(), overTiredness: goalBodyCondition.tiredness)
                    try printAfterRoutineResult()
                    break
                } catch FitnessCenterError.unreachedGoal {
                    print("--------------------")
                    print("목표치에 도달하지 못 했습니다. 현재 \(member.name)님의 컨디션은 다음과 같습니다.")
                    member.bodyCondition.printMucleStatus()
                } catch FitnessCenterError.runAwayMember {
                    print("--------------------")
                    print("\(member.name)님의 피로도가 \(member.bodyCondition.tiredness)입니다. 회원님이 도망갔습니다.")
                    break
                } catch {
                    print("에러메시지를 확인해주세요. \(error)")
                    break
                }
            }
        }
    }
    
    func printAfterRoutineResult() throws {
        if let member = member {
            guard member.bodyCondition.upperBodyMuscleStrength >= goalBodyCondition.upperBodyMuscleStrength,
                  member.bodyCondition.lowerBodyMuscleStrength >= goalBodyCondition.lowerBodyMuscleStrength,
                  member.bodyCondition.muscularEndurance >= goalBodyCondition.muscularEndurance else {
                throw FitnessCenterError.unreachedGoal
            }
            print("--------------------")
            print("성공입니다! 현재 \(member.name)님의 컨디션은 다음과 같습니다.")
            member.bodyCondition.printMucleStatus()
        }
    }
    
    func registerMember() {
        print("안녕하세요 \(centerName) 피트니스 센터 입니다. 회원님의 이름을 알려주세요.")
        while true {
            do {
                member = Person(name: try inputToString(), bodyCondition: BodyCondition(upperBodyMuscleStrength: 0, lowerBodyMuscleStrength: 0, muscularEndurance: 0, tiredness: 0))
                break
            } catch InputError.notString {
                print("한글 또는 영문으로 입력해주세요.")
            } catch {
                print("에러메시지를 확인해주세요. \(error)")
            }
        }
    }
    
    func selectGoalUpperBody() {
        while true {
            do {
                print("상체근력 : ", terminator: "")
                try goalBodyCondition.upperBodyMuscleStrength += inputToInt()
                break
            } catch InputError.notInt {
                print("숫자로 입력해주세요.")
            } catch {
                print("에러메시지를 확인해주세요. \(error)")
            }
        }
    }
    
    func selectGoalLowerBody() {
        while true {
            do {
                print("하체근력 : ", terminator: "")
                try goalBodyCondition.lowerBodyMuscleStrength += inputToInt()
                break
            } catch InputError.notInt {
                print("숫자로 입력해주세요.")
            } catch {
                print("에러메시지를 확인해주세요. \(error)")
            }
        }
    }
    
    func selectGoalmuscularEndurance() {
        while true {
            do {
                print("근지구력 : ", terminator: "")
                try goalBodyCondition.muscularEndurance += inputToInt()
                break
            } catch InputError.notInt {
                print("숫자로 입력해주세요.")
            } catch {
                print("에러메시지를 확인해주세요. \(error)")
            }
        }
    }
    
    func selecNowTiredness() {
        while true {
            do {
                print("현재 피로도 : ", terminator: "")
                if let member = member {
                    try member.bodyCondition.tiredness += inputToInt()
                    break
                }
            } catch InputError.notInt {
                print("숫자로 입력해주세요.")
            } catch {
                print("에러메시지를 확인해주세요. \(error)")
            }
        }
    }
    
    func selectGoalBodyCondition() {
        print("--------------------")
        print("운동 목표치를 순서대로 알려주세요. 예시) 상체근력: 130, 하체근력: 120, 근지구력: 150")
        selectGoalUpperBody()
        selectGoalLowerBody()
        selectGoalmuscularEndurance()
        print("현재 피로도를 0에서 100 사이의 숫자로 알려주세요!")
        selecNowTiredness()
    }
    
    func chooseRountine(from routineList: [Routine]) -> Routine {
        while true {
            do {
                print("--------------------")
                print("몇 번째 루틴으로 하시겠어요?")
                for (index, routine) in routineList.enumerated() {
                    print("\(index + 1). \(routine.name)")
                }
                let index = try inputToInt() - 1
                
                guard routineList.indices.contains(index) else {
                    throw FitnessCenterError.invaildRoutine
                }
                return routineList[index]
            } catch FitnessCenterError.invaildRoutine {
                print("선택한 루틴이 없습니다.")
            } catch InputError.notInt {
                print("숫자로 입력해주세요.")
            } catch {
                print("에러메시지를 확인해주세요. \(error)")
            }
        }
    }
    
    func setCountOfRoutine() -> Int {
        while true {
            do {
                print("--------------------")
                print("몇 세트 반복 하시겠어요?")
                let setCounter = try inputToInt()
                return setCounter
            } catch InputError.notInt {
                print("숫자로 입력해주세요.")
            } catch {
                print("에러메시지를 확인해주세요. \(error)")
            }
        }
    }
    
    func startForTotalRoutine() {
        registerMember()
        selectGoalBodyCondition()
            do {
                try proceedExercise()
            } catch {
                print("에러메시지를 확인해주세요. \(error)")
            }
        }
}
