class BodyCondition {
    var upperBodyStrength: Int {
        didSet(previousValue) {
            if upperBodyStrength >= previousValue {
                print("상체근력이 \(upperBodyStrength - previousValue) 상승합니다.")
            } else {
                print("상체근력이 \(previousValue - upperBodyStrength) 하락합니다.")
            }
        }
    }
    var lowerBodyStrength: Int {
        didSet(previousValue) {
            if lowerBodyStrength >= previousValue {
                print("하체근력이 \(lowerBodyStrength - previousValue) 상승합니다.")
            } else {
                print("하체근력이 \(previousValue - upperBodyStrength) 하락합니다.")
            }
        }
    }
    var muscularEndurance: Int {
        didSet(previousValue) {
            if muscularEndurance >= previousValue {
                print("근지구력이 \(muscularEndurance - previousValue) 상승합니다.")
            } else {
                print("근지구력이 \(previousValue - muscularEndurance) 하락합니다.")
            }
        }
    }
    var fatigueLevel: Int {
        didSet(previousValue) {
            if fatigueLevel >= previousValue {
                print("피로도가 \(fatigueLevel - previousValue) 상승합니다.")
            } else {
                print("피로도가 \(previousValue - fatigueLevel) 하락합니다.")
            }
        }
    }
    
    init(upperBodyStrengthValue: Int, lowerBodyStrengthValue: Int, muscularEnduranceValue: Int, fatigueLevelValue: Int) {
        upperBodyStrength = upperBodyStrengthValue
        lowerBodyStrength = lowerBodyStrengthValue
        muscularEndurance = muscularEnduranceValue
        fatigueLevel = fatigueLevelValue
    }
    
    func changeUpperBodyStrength(by number: Int) {
        upperBodyStrength += number
    }
    
    func changeLowerBodyStrength(by number: Int) {
        lowerBodyStrength += number
    }
    
    func changeMuscularEndurance(by number: Int) {
        muscularEndurance += number
    }
    
    func changeFatigueLevel(by number: Int) {
        fatigueLevel += number
    }
    
    func showBodyCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigueLevel)")
        print("----------------")
    }
}
