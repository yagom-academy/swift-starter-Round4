//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum FitnessCenterError: Error {
    case forcedTermination
    case nonEnglish
    case failedToAchieveGoal
    case emptyMember
}

struct FitnessCenter {
    let name: String
    var goalsBodyCondition: BodyCondition
    var member: Person?
    var routines: [Routine]
    
    init(name: String, routines: Routine...) {
        self.name = name
        self.routines = routines
        goalsBodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscleEndurance: 0)
    }
    
    func repeatRoutine(_ routine: Routine, times: Int) throws {
        if let member = member {
            do {
                try member.exercise(for: times, routine: routine)
            } catch PersonError.beDrained {
                throw PersonError.beDrained
            } catch {
                print("Unexpected Error : \(error)")
            }
            if checkGoals(bodyCondition: member.bodyCondition) {
                print(newLineString)
                print("성공입니다!", terminator: "")
                member.printMyBodyCondition()
            } else {
                throw FitnessCenterError.failedToAchieveGoal
            }
        } else {
            throw FitnessCenterError.emptyMember
        }
    }
    
    func checkGoals(bodyCondition: BodyCondition) -> Bool {
        if goalsBodyCondition.upperBodyStrength <= bodyCondition.upperBodyStrength && goalsBodyCondition.lowerBodyStrength <= bodyCondition.lowerBodyStrength && goalsBodyCondition.muscleEndurance <= bodyCondition.muscleEndurance {
            return true
        } else {
            return false
        }
    }
    
    mutating func startFitnessProgram() {
        var isAchieved = false
        print("안녕하세요. \(name) 피티니스 센터입니다.")
        do {
            try enterName()
            try enterGoalsBodyCondition()
        } catch FitnessCenterError.forcedTermination {
            print(newLineString)
            print("프로그램이 강제 종료됩니다!!")
            return
        } catch {
            print(newLineString)
            print("Unexpected Error : \(error)")
            return
        }

        while !isAchieved {
            do {
                if let selectedRoutine = try selectRoutine() {
                    if let decidedSet = try decideSet() {
                        try repeatRoutine(selectedRoutine, times: decidedSet)
                        isAchieved = !isAchieved
                    }
                }
            } catch FitnessCenterError.forcedTermination {
                print(newLineString)
                print("프로그램이 강제 종료됩니다!!")
                return
            } catch FitnessCenterError.failedToAchieveGoal {
                print(newLineString)
                print("목표치에 도달하지 못했습니다. ", terminator: "")
                member?.printMyBodyCondition() ?? print("member is nil")
            } catch PersonError.beDrained {
                print(newLineString)
                print("\(member?.name ?? "")회원이 탈진하여 도망갔습니다!")
                return
            } catch FitnessCenterError.emptyMember {
                print(newLineString)
                print("member is nil")
                return
            } catch {
                print(newLineString)
                print("Unexpected Error : \(error)")
                return
            }
        }
    }
    
    mutating func enterName() throws {
        var isCorrect = false
        while !isCorrect {
            print(newLineString)
            print("회원님의 이름(영어)을 입력해주세요.")
            print("(공백, 특수문자, 한글 입력금지)(강제종료:q!)")
            print("입력란 : ", terminator: "")
            if let inputName = readLine() {
                if inputName == "q!" {
                    throw FitnessCenterError.forcedTermination
                }
                do {
                    try checkNonEnglish(target: inputName)
                    setMember(name: inputName)
                    isCorrect = true
                } catch FitnessCenterError.nonEnglish {
                    print(newLineString)
                    print("잘못된 입력값 입니다. 영어만 입력해 주세요.")
                } catch {
                    print(newLineString)
                    print("Unexpected Error : \(error)")
                }
                
            } else {
                print(newLineString)
                print("입력값이 없습니다. 다시 입력해 주세요.")
            }
        }
    }
    
    func checkNonEnglish(target: String) throws {
        for character in target.unicodeScalars {
            if !((character.value >= 65 && character.value <= 90) || (character.value >= 97 && character.value <= 122)) {
                throw FitnessCenterError.nonEnglish
            }
        }
    }
    
    mutating func setMember(name: String) {
        member = Person(name: name, bodyCondition: BodyCondition(upperBodyStrength: 30, lowerBodyStrength: 30, muscleEndurance: 10))
    }
    
    mutating func enterGoalsBodyCondition() throws {
        let bodyConditionProperty = ["upperBodyStrength", "lowerBodyStrength", "muscleEndurance"]
        var propertyPoint = 0
        print(newLineString)
        print("운동 목표를 입력해 주세요.")
        while propertyPoint < 3{
            print(newLineString)
            print("\(bodyConditionProperty[propertyPoint]) 목표(0보다 큰 자연수)(강제종료:q!)")
            print("입력란 : ", terminator: "")
            if let inputData = readLine() {
                if inputData == "q!" {
                    throw FitnessCenterError.forcedTermination
                }
                if let inputInt = Int(inputData) {
                    if inputInt <= 0 {
                        print(newLineString)
                        print("입력값이 0 또는 음수입니다. 0 보다 큰 자연수를 입력해 주세요.")
                        continue
                    }
                    setGoalsBodyConditionProperty(propertyPoint, golas: inputInt)
                } else {
                    print(newLineString)
                    print("숫자가 입력되지 않았습니다. 0보다 큰 자연수를 입력해 주세요.")
                    continue
                }
            } else {
                print(newLineString)
                print("입력값이 없습니다. 다시 입력해주세요.")
            }
            propertyPoint += 1
        }
    }
    
    mutating func setGoalsBodyConditionProperty(_ propertyPoint: Int, golas: Int) {
        switch propertyPoint {
        case 0:
            goalsBodyCondition.upperBodyStrength = golas
        case 1:
            goalsBodyCondition.lowerBodyStrength = golas
        default:
            goalsBodyCondition.muscleEndurance = golas
        }
    }
    
    func selectRoutine() throws -> Routine? {
        var selectedRoutine: Routine?
        var isSelected = false
        print(newLineString)
        print("루틴을 선택하세요!!!")
        printRoutine()
        while !isSelected {
            print(newLineString)
            print("원하는 루틴의 번호를 입력하세요.(강제종료:q!)(루틴정보 다시보기:i!)")
            print("입력란 : ", terminator: "")
            if let inputData = readLine() {
                if inputData == "q!" {
                    throw FitnessCenterError.forcedTermination
                } else if inputData == "i!" {
                    print(newLineString)
                    printRoutine()
                    continue
                }
                if let inputInt = Int(inputData) {
                    if inputInt > 0 && inputInt <= routines.count {
                        selectedRoutine = routines[inputInt-1]
                        isSelected = !isSelected
                    } else {
                        print(newLineString)
                        print("해당 번호의 루틴은 존재하지 않습니다. 확인 후 다시 입력해주세요.")
                    }
                } else {
                    print(newLineString)
                    print("원하시는 루틴의 번호만 입력해 주세요.")
                }
            } else {
                print(newLineString)
                print("입력값이 없습니다. 다시 입력해 주세요.")
            }
        }
        return selectedRoutine
    }
    
    func printRoutine() {
        var count = 1
        for routine in routines {
            print("\(count). \(routine.name)")
            count += 1
        }
    }
    
    func decideSet() throws -> Int? {
        var isdecided = false
        var set: Int?
        while !isdecided {
            print(newLineString)
            print("몇 세트 반복하시겠어요?(최소 1회 이상)(강제종료:q!)")
            print("입력란 : ", terminator: "")
            if let inputData = readLine() {
                if inputData == "q!" {
                    throw FitnessCenterError.forcedTermination
                }
                if let inputInt = Int(inputData) {
                    if inputInt > 0 {
                        set = inputInt
                        isdecided = true
                    } else {
                        print(newLineString)
                        print("최소 1회 이상의 횟수를 입력해 주세요.")
                    }
                } else {
                    print(newLineString)
                    print("숫자만 입력해 주세요!")
                }
            } else {
                print(newLineString)
                print("입력값이 없습니다. 다시 입력해 주세요.")
            }
        }
        return set
    }
}
