import Foundation

class Tablet {
    let name: String
    var member: Person?
    var targetBodyCondition: BodyCondition?
    var routineList: [Routine]
    var routineSet: Int = 0
    var routineNumber: Int = 0
    var currentStep: Int = 1

    init(name: String, routineList: [Routine]) {
        self.name = name
        self.routineList = routineList
    }

    func progressStep() {
        while currentStep < 4 {
            if currentStep == 1 {
                print("안녕하세요. \(name) 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
                inputName()
                currentStep += 1
            } else if currentStep == 2 {
                print("운동 목표치를 순서대로 알려주세요. 예시) 상체근력:130, 하체근력:120, 근지구력:150")
                print("강제종료를 원할시에 'q'를 입력하세요")
                inputTargetBodyCondition()
                currentStep += 1
            } else if currentStep == 3 {
                askWhichRoutineWantToChoose()
                askRoutineSets()
                currentStep += 1
            }
        }
    }

    func inputName() {
        print("-------------------------")
        print("특수문자, 숫자 사용금지")
        print("강제종료를 원할시에 'q'를 입력하세요")
        print("여기에 입력해주세요: ", terminator: "")
        guard let input = readLine() else { return }
        var inputHasProblem = true
        inputHasProblem = checkInputHasError(input: input, inputMustContainOnlyNumber: false)
        if inputHasProblem {
            inputName()
        }
        member = addMember(name: input)
        if let member = member {
            print("반갑습니다. \(member.name) 회원님")
        }
    }

    func inputTargetBodyCondition() {
        print("상체근력: ", terminator: "")
        guard let inputUpperBodyStrength = readLine() else { return }
        var inputHasProblem = true
        inputHasProblem = checkInputHasError(input: inputUpperBodyStrength, inputMustContainOnlyNumber: true)
        if inputHasProblem {
            inputTargetBodyCondition()
        }

        print("하체근력: ", terminator: "")
        guard let inputLowerBodyStrength = readLine() else { return }
        inputHasProblem = true
        inputHasProblem = checkInputHasError(input: inputLowerBodyStrength, inputMustContainOnlyNumber: true)
        if inputHasProblem {
            inputTargetBodyCondition()
        }

        print("근지구력: ", terminator: "")
        guard let inputEndurance = readLine() else { return }
        inputHasProblem = true
        inputHasProblem = checkInputHasError(input: inputEndurance, inputMustContainOnlyNumber: true)
        if inputHasProblem {
            inputTargetBodyCondition()
        }

        if let upperBodyStrength = convertStringToInt(string: inputUpperBodyStrength),
           let lowerBodyStrength = convertStringToInt(string: inputLowerBodyStrength),
           let muscleEndurance = convertStringToInt(string: inputEndurance) {
            setTargetBodyCondition(upperBodyStrength: upperBodyStrength, lowerBodyStrength: lowerBodyStrength, muscleEndurance: muscleEndurance)
        }
    }

    func askWhichRoutineWantToChoose() {
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

    func askRoutineSets() {
        print("몇 세트 반복하시겠어요?")
        if let input = readLine() {
            routineSet = convertStringToInt(string: input)!
        }
    }

    func addMember(name: String) -> Person {
        let member = Person(name: name, bodyCondition: BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscleEndurance: 0, fatigue: 0))

        return member
    }

    func setTargetBodyCondition(upperBodyStrength: Int, lowerBodyStrength: Int, muscleEndurance: Int) {
        targetBodyCondition = BodyCondition(upperBodyStrength: upperBodyStrength, lowerBodyStrength: lowerBodyStrength, muscleEndurance: muscleEndurance)
    }

    func checkInputHasError(input: String, inputMustContainOnlyNumber: Bool) -> Bool {
        do {
            try checkInputHasCommonError(input: input, InputMustContainOnlyNumber: inputMustContainOnlyNumber)
            return false
        } catch commonError.quit {
            print("강제종료 합니다.")
            exit(0)
        } catch commonError.containSpecialCharacter {
            print("특수문자를 포함하지 마세요")
            return true
        } catch commonError.containNotNumber {
            print("숫자만 입력해주세요")
            return true
        } catch {
            print("알 수 없는 오류가 발생했습니다. 종료합니다")
            exit(0)
        }
    }

    func checkInputHasCommonError(input: String, InputMustContainOnlyNumber: Bool) throws {
        if doesUserWantForcedQuit(input) {

            throw commonError.quit
        } else if doesStringContainsSpecialCharacter(target: input) {

            throw commonError.containSpecialCharacter
        } else if InputMustContainOnlyNumber {
            if !doesStringContainsOnlyNumber(target: input) {

                throw commonError.containNotNumber
            }
        } else if !InputMustContainOnlyNumber {
            if doesStringContainsNumber(target: input) {

                throw commonError.containNumber
            }
        }
    }

    func convertStringToInt(string: String) -> Int? {
        var convertedInt: Int? = 0
        if doesStringContainsOnlyNumber(target: string) {
            convertedInt = Int(string) ?? nil
        }

        return convertedInt
    }
}

