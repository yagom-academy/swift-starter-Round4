import Foundation

enum InputError: Error {
    case quit
    case containSpecialCharacter
    case containNumber
}

struct FitnessCenter {
    var name: String
    var targetBodyCondition: BodyCondition
    var member: Person?
    var routineList: [Routine]

    mutating func greeting() {
        print("안녕하세요. \(name) 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        inputName()
    }

    mutating func askBodyCondition() {
        print("운동 목표치를 순서대로 알려주세요. 예시) 상체근력:130, 하체근력:120, 근지구력:150")
    }

    mutating func inputName() {
        print("-------------------------")
        print("특수문자, 숫자 사용금지")
        print("강제종료를 원할시에 'q'를 입력하세요")
        print("여기에 입력해주세요: ", terminator: "")
        if let inputName = readLine() {
            do {
                try checkUserWantForcedQuit(inputName)
                try checkStringContainsSpecialCharacter(target: inputName)
                try checkStringContainsNumber(target: inputName)
                self.member = addMember(name: inputName)
                print("반갑습니다. \(inputName) 회원님")
            } catch InputError.quit {
                print("-------------------------")
                print("강제종료 합니다.")
            } catch InputError.containSpecialCharacter {
                print("-------------------------")
                print("특수문자를 포함하지 마세요")
                self.inputName()
            } catch InputError.containNumber {
                print("-------------------------")
                print("숫자를 포함하지 마세요")
                self.inputName()
            } catch {
                print(error)
            }
        }
    }

    func checkUserWantForcedQuit(_ input: String) throws {
        if input == "q" || input == "'q'"{
            throw InputError.quit
        }
    }

    func checkStringContainsSpecialCharacter(target: String) throws {
        let letters = CharacterSet.punctuationCharacters
        let range = target.rangeOfCharacter(from: letters)
        if range != nil {
            throw InputError.containSpecialCharacter
        }
    }

    func checkStringContainsNumber(target: String) throws {
        let letters = CharacterSet.decimalDigits
        let range = target.rangeOfCharacter(from: letters)
        if range != nil {
            throw InputError.containNumber
        }
    }

    func addMember(name: String) -> Person {
        let member = Person(name: name, bodyCondition: BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscleEndurance: 0, fatigue: 0))

        return member
    }
}
