import Foundation

struct FitnessCenter {
    let name: String
    var targetBodyCondition: BodyCondition?
    var member: Person?
    var routines = [Routine]()
    var chosenRoutine: Routine?
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addRoutine(routine: Routine) {
        self.routines.append(routine)
    }
    
    mutating func register(member: Person) {
        self.member = member
    }
    
    func checkMember(member: Person) throws {
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
        self.targetBodyCondition?.upperBodyStrength = targetUpperBodyStrength
        print("\(targetUpperBodyStrength)")
        print("하체근력", terminator: ": ")
        guard let targetLowerBodyStrength = Int(readLine()!) else {
            throw FitnessProgramError.inappropriateInput
        }
        self.targetBodyCondition?.lowerBodyStrength = targetLowerBodyStrength
        print("\(targetLowerBodyStrength)")
        print("근지구력", terminator: ": ")
        guard let targetMuscularEndurance = Int(readLine()!) else {
            throw FitnessProgramError.inappropriateInput
        }
        self.targetBodyCondition?.muscularEndurance = targetMuscularEndurance
        print("\(targetMuscularEndurance)")
        self.targetBodyCondition?.fatigue = 100
    }
    
    func chooseRoutine() throws -> Routine{
        print("몇 번째 루틴으로 운동하시겠어요?")
        for i in 1...routines.count {
            print("\(i). \(routines[i - 1].name)")
        }
        guard let routineNo = Int(readLine()!) else {
            throw FitnessProgramError.inappropriateInput
        }
//        routines[routineNo-1].run()
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
        
//
//        if (member.bodyCondition.upperBodyStrength >= targetBodyCondition.upperBodyStrength && member.bodyCondition.lowerBodyStrength >= targetBodyCondition.lowerBodyStrength && member.bodyCondition.muscularEndurance >= targetBodyCondition.muscularEndurance){
//            programSuccess(member: member)
//        } else {
//            programFailUnderscore(member: member)
//            try chooseRoutine()
//        }
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


func programFailUnderscore(member: Person) {
    print("""
        ----------
        목표치에 도달하지 못했습니다. 현재 \(member.name)님의 컨디션은 다음과 같습니다.
        상체근력: \(member.bodyCondition.upperBodyStrength)
        하체근력: \(member.bodyCondition.lowerBodyStrength)
        근지구력: \(member.bodyCondition.muscularEndurance)
        피로도: \(member.bodyCondition.fatigue)
        """)
}
