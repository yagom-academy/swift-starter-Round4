import Foundation

struct FitnessCenter {
    let name: String
    var targetBodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)
    var member: Person?
    var routines = [Routine]()
    var chosenRoutine: Routine?
    // do-catch 블록 안의 변수는 해당 do-catch 블록 밖에서 사용할 수 없기 때문에
    // do-catch 안에서 조작한 내용을 담을 변수(targetBodyCondition, chosenRoutine)을 미리 선언
    // do-catch 안에서 해당 변수의 값을 변경하면
    // 변경된 값을 가진 변수를 struct 내의 다른 함수에서 사용할 수 있음
    
    
    // to improve: targetBodyCondition을 Optional로 구현
    // to improve: memberList, targetBodyConditionList 구현
    // to improve: 회원별 maxFatigue 설정 구현
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addRoutine(routine: Routine) {
        self.routines.append(routine)
    }
    
    mutating func register(member: Person) {
        self.member = member
    }
    
    mutating func checkMember(member: Person) throws {
        print("안녕하세요. \(name) 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        
        if let inputName: String = readLine() {
            if inputName == member.name {
                print("\(inputName) 회원님, 환영합니다!")
            } else {
                throw FitnessProgramError.noMember
            }
        } else {
            throw FitnessProgramError.inappropriateInput
        }
        
    }
    
    mutating func setGoals() throws {
        print("운동 목표치를 순서대로 알려주세요.")
        print("상체근력", terminator: ": ")
        guard let targetUpperBodyStrength = Int(readLine()!) else {
            throw FitnessProgramError.inappropriateInput
        }
        targetBodyCondition.upperBodyStrength = targetUpperBodyStrength
        print("\(targetUpperBodyStrength)")
        print("하체근력", terminator: ": ")
        guard let targetLowerBodyStrength = Int(readLine()!) else {
            throw FitnessProgramError.inappropriateInput
        }
        targetBodyCondition.lowerBodyStrength = targetLowerBodyStrength
        print("\(targetLowerBodyStrength)")
        print("근지구력", terminator: ": ")
        guard let targetMuscularEndurance = Int(readLine()!) else {
            throw FitnessProgramError.inappropriateInput
        }
        targetBodyCondition.muscularEndurance = targetMuscularEndurance
        print("\(targetMuscularEndurance)")
        targetBodyCondition.fatigue = 100
    }
    
    func chooseRoutine() throws -> Routine {
        print("몇 번째 루틴으로 운동하시겠어요?")
        for i in 1...routines.count {
            print("\(i). \(routines[i - 1].name)")
        }
        guard let routineNo = Int(readLine()!) else {
            throw FitnessProgramError.inappropriateInput
        }
        if (routineNo) > routines.count {
            throw FitnessProgramError.inappropriateInput
        }
        return routines[routineNo - 1]
    }
    
    func setRepetition() throws -> Int {
        print("몇 세트 반복하시겠어요?")
        guard let repetition = Int(readLine()!) else {
            throw FitnessProgramError.inappropriateInput
        }
        return repetition
    }
    

    mutating func runFitnessProgram(member: Person) throws {

        do {
            try checkMember(member: member)
        } catch FitnessProgramError.noMember {
            print("회원 이름이 일치하지 않습니다.")
            try checkMember(member: member)
        } catch FitnessProgramError.inappropriateInput {
            print("이름을 다시 입력해주세요.")
            try checkMember(member: member)
        }
        
        do {
            try setGoals()
        } catch FitnessProgramError.inappropriateInput {
            print("입력값이 잘못되었습니다. 정수로 입력해주세요")
            try setGoals()
        }
        
        do {
            chosenRoutine = try chooseRoutine()
        } catch FitnessProgramError.inappropriateInput {
            print("루틴을 다시 골라주세요.")
            chosenRoutine = try chooseRoutine()
        }
        
        do {
            let repetition = try setRepetition()
            if let chosenRoutine = chosenRoutine {
                member.exercise(for: repetition, routine: chosenRoutine)
            }
        } catch FitnessProgramError.inappropriateInput {
            print("입력값이 잘못되었습니다. 정수로 입력해주세요")
            let repetition = try setRepetition()
            if let chosenRoutine = chosenRoutine {
                member.exercise(for: repetition, routine: chosenRoutine)
            }
        }
        
        // 연산 프로퍼티를 이용해서 구현하는 방법 고민
        if (member.bodyCondition.upperBodyStrength >= targetBodyCondition.upperBodyStrength && member.bodyCondition.lowerBodyStrength >= targetBodyCondition.lowerBodyStrength && member.bodyCondition.muscularEndurance >= targetBodyCondition.muscularEndurance){
            programSuccess(member: member)
        } else {
            targetUnreached(member: member)
            chosenRoutine = try chooseRoutine()
        }
    }
    
}

func programSuccess(member: Person) {
    print("""
        ----------
        성공입니다! 현재 \(member.name)님의 컨디션은 다음과 같습니다.
        상체근력: \(member.bodyCondition.upperBodyStrength)
        하체근력: \(member.bodyCondition.lowerBodyStrength)
        근지구력: \(member.bodyCondition.muscularEndurance)
        피로도: \(member.bodyCondition.fatigue)
        """
    )
}


func targetUnreached(member: Person) {
    print("""
        ----------
        목표치에 도달하지 못했습니다. 현재 \(member.name)님의 컨디션은 다음과 같습니다.
        상체근력: \(member.bodyCondition.upperBodyStrength)
        하체근력: \(member.bodyCondition.lowerBodyStrength)
        근지구력: \(member.bodyCondition.muscularEndurance)
        피로도: \(member.bodyCondition.fatigue)
        """)
}
