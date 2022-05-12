import Foundation

struct FitnessCenter {
    var name: String
    var targetBodyCondition: BodyCondition?
    var member: Person?
    var routineList: [Routine]
    var routineNumber: Int = 0

    mutating func startExercise() {
        greeting()
        askBodyCondition()
        readyToExercise()
    }

    mutating func greeting() {
        print("안녕하세요. \(name) 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        inputName()
    }

    mutating func askBodyCondition() {
        print("운동 목표치를 순서대로 알려주세요. 예시) 상체근력:130, 하체근력:120, 근지구력:150")
        print("강제종료를 원할시에 'q'를 입력하세요")
        inputTargetBodyCondition()
    }

    mutating func readyToExercise() {
        askWhichRoutineWantToChoose()
        let routineSets = askRoutineSets()
        doExercise(routineNumber: routineNumber, sets: routineSets)
    }

    mutating func inputName() {
        print("-------------------------")
        print("특수문자, 숫자 사용금지")
        print("강제종료를 원할시에 'q'를 입력하세요")
        print("여기에 입력해주세요: ", terminator: "")
        guard let input = readLine() else { return }
        var inputHasProblem = true
        do {
            try checkInputHasCommonError(input: input, InputMustContainOnlyNumber: false)
            inputHasProblem = false
        } catch commonError.quit {
            print("강제종료 합니다.")
            exit(0)
        } catch commonError.containSpecialCharacter {
            print("특수문자를 포함하지 마세요")
            inputHasProblem = true
        } catch commonError.containNumber {
            print("숫자는 입력하지 마세요")
            inputHasProblem = true
        } catch {
            print("알 수 없는 오류가 발생했습니다. 종료합니다")
            exit(0)
        }
        if inputHasProblem {
            inputName()
        }
        member = addMember(name: input)
        if let member = member {
            print("반갑습니다. \(member.name) 회원님")
        }
    }

    mutating func inputTargetBodyCondition() {
        print("상체근력: ", terminator: "")
        let inputUpperBodyStrength = readLine()
        print("하체근력: ", terminator: "")
        let inputLowerBodyStrength = readLine()
        print("근지구력: ", terminator: "")
        let inputEndurance = readLine()

        guard let inputUpperBodyStrength = inputUpperBodyStrength,
              let inputLowerBodyStrength = inputLowerBodyStrength,
              let inputEndurance = inputEndurance else { return }
        var inputStrengthArray: [String] = []
        inputStrengthArray.append(contentsOf: [inputUpperBodyStrength, inputLowerBodyStrength, inputEndurance])
        var inputHasProblem: [Bool] = []

        for input in inputStrengthArray {
            do {
                try checkInputHasCommonError(input: input, InputMustContainOnlyNumber: true)
                inputHasProblem.append(false)
            } catch commonError.quit {
                print("강제종료 합니다.")
                exit(0)
            } catch commonError.containSpecialCharacter {
                print("특수문자를 포함하지 마세요")
                inputHasProblem.append(true)
            } catch commonError.containNotNumber {
                print("숫자만 입력해주세요")
                inputHasProblem.append(true)
            } catch {
                print("알 수 없는 오류가 발생했습니다. 종료합니다")
                exit(0)
            }
        }
        if inputHasProblem.contains(true) {
            inputTargetBodyCondition()
        }
        if let upperBodyStrength = convertStringToInt(string: inputStrengthArray[0]),
           let lowerBodyStrength = convertStringToInt(string: inputStrengthArray[1]),
           let muscleEndurance = convertStringToInt(string: inputStrengthArray[2]) {
            setTargetBodyCondition(upperBodyStrength: upperBodyStrength, lowerBodyStrength: lowerBodyStrength, muscleEndurance: muscleEndurance)
        }
    }

    mutating func askWhichRoutineWantToChoose() {
        print("--------------------")
        print("몇 번째 루틴으로 운동하시겠어요?")
        print("강제종료를 원할시에 'q'를 입력하세요")
        for number in 1...routineList.count {
            print("\(number). \(routineList[number-1].name)")
        }
        guard let input = readLine() else { return }
        var inputHasProblem = true
        do {
            try checkInputHasCommonError(input: input, InputMustContainOnlyNumber: true)
            guard let inputNumber = convertStringToInt(string: input) else { return }
            try doesInputNumberIsBetween(1, and: routineList.count, inputNumber: inputNumber)
            routineNumber = inputNumber
            inputHasProblem = false
        } catch commonError.quit {
            print("강제종료 합니다.")
            exit(0)
        } catch commonError.containSpecialCharacter {
            print("특수문자를 포함하지 마세요")
            inputHasProblem = true
        } catch commonError.containNotNumber {
            print("숫자만 입력해주세요")
            inputHasProblem = true
        } catch InputChooseRoutinError.outOfRoutinRange {
            print("입력 숫자가 루틴 선택지에 벗어났습니다.")
            inputHasProblem = true
        } catch {
            print("알 수 없는 오류가 발생했습니다. 종료합니다")
            exit(0)
        }
        if inputHasProblem {
            askWhichRoutineWantToChoose()
        }
    }

    func askRoutineSets() -> Int {
        var routineSets: Int = 0
        print("몇 세트 반복하시겠어요?")
        if let input = readLine() {
            routineSets = convertStringToInt(string: input)!
        }

        return routineSets
    }

    mutating func doExercise(routineNumber: Int, sets: Int) {
        var reachedTargetBodyCondition = false
        print("--------------------")
        print("\(routineList[routineNumber - 1].name)을 \(sets)set 시작합니다.")
        guard var member = member else { return }
        let routineCount = routineList[routineNumber - 1].routineOrder.count
        for _ in 1...sets {
            for count in 0..<routineCount {
                member.exercise(routine: routineList[routineNumber - 1], count: count)
                do {
                    try checkExausted(member: member)
                } catch WhileExercisingError.overFatigue {
                    print("--------------------")
                    print("한계 피로도는 300입니다.")
                    print("\(member.name)님의 피로도가 \(member.bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
                    exit(0)
                } catch {
                    print("알 수 없는 오류가 발생했습니다. 종료합니다")
                    exit(0)
                }
            }
        }
        do {
            try checkReachedTargetBodyCondition(whose: member, targetBodyCondition: targetBodyCondition)
            reachedTargetBodyCondition = true
            print("Success")
        } catch WhileExercisingError.unreachedTarget {
            print("--------------------")
            print("목표치에 도달하지 못했습니다. 현재 \(member.name)님의 컨디션은 다음과 같습니다.")
            printCurrentBodyCondition(whose: member)
            reachedTargetBodyCondition = false
        } catch {
            print(error)
        }
        if !reachedTargetBodyCondition {
            readyToExercise()
        }
        print("성공입니다! 현재 \(member.name)님의 컨디션은 다음과 같습니다.")
        printCurrentBodyCondition(whose: member)
    }

    func addMember(name: String) -> Person {
        let member = Person(name: name, bodyCondition: BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscleEndurance: 0, fatigue: 0))

        return member
    }

    mutating func setTargetBodyCondition(upperBodyStrength: Int, lowerBodyStrength: Int, muscleEndurance: Int) {
        targetBodyCondition = BodyCondition(upperBodyStrength: upperBodyStrength, lowerBodyStrength: lowerBodyStrength, muscleEndurance: muscleEndurance)
    }

    func printCurrentBodyCondition(whose: Person) {
        print("상체근력: \(whose.bodyCondition.upperBodyStrength)")
        print("하체근력: \(whose.bodyCondition.lowerBodyStrength)")
        print("근지구력: \(whose.bodyCondition.muscleEndurance)")
        print("피로도: \(whose.bodyCondition.fatigue)")
    }

    func convertStringToInt(string: String) -> Int? {
        var convertedInt: Int? = 0
        if doesStringContainsOnlyNumber(target: string) {
            convertedInt = Int(string) ?? nil
        }

        return convertedInt
    }
}
