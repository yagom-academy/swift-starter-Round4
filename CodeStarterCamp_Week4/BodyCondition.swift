class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigueLevel: Int
    
    init(upperBodyStrengthValue: Int, lowerBodyStrengthValue: Int, muscularEnduranceValue: Int, fatigueLevelValue: Int) {
        upperBodyStrength = upperBodyStrengthValue
        lowerBodyStrength = lowerBodyStrengthValue
        muscularEndurance = muscularEnduranceValue
        fatigueLevel = fatigueLevelValue
    }
    
    func changeUpperBodyStrength(by number: Int) {
        upperBodyStrength += number
        
        if number > 0 {
            print("상체근력이 \(number) 상승합니다.")
        } else {
            print("상체근력이 \(number * -1) 하락합니다.")
        }
    }
    
    func changeLowerBodyStrength(by number: Int) {
        lowerBodyStrength += number
        
        if number > 0 {
            print("하체근력이 \(number) 상승합니다.")
        } else {
            print("하체근력이 \(number * -1) 하락합니다.")
        }
    }
    
    func changeMuscularEndurance(by number: Int) {
        muscularEndurance += number
        
        if number > 0 {
            print("근지구력이 \(number) 상승합니다.")
        } else {
            print("근지구력이 \(number * -1) 하락합니다.")
        }
    }
    
    func changeFatigueLevel(by number: Int) {
        fatigueLevel += number
        
        if number > 0 {
            print("근지구력이 \(number) 상승합니다.")
        } else {
            print("근지구력이 \(number * -1) 하락합니다.")
        }
    }
    
    func showBodyCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigueLevel)")
    }
}
