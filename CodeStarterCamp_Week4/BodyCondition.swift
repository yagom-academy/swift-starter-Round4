class BodyCondition {
    var upperBodyStrength: Int {
        willSet {
            print("상체근력이 \(newValue - upperBodyStrength) 상승합니다.")
        }
    }
    var lowerBodyStrength: Int {
        willSet {
            print("하체근력이 \(newValue - lowerBodyStrength) 상승합니다.")
        }
    }
    var muscularEndurance: Int {
        willSet {
            print("근지구력이 \(newValue - muscularEndurance) 상승합니다.")
        }
    }
    var fatigue: Int {
        willSet {
            if newValue > fatigue {
                print("피로도가 \(newValue - fatigue) 상승합니다.")
            } else {
                print("피로도가 \(fatigue - newValue) 하락합니다.")
            }
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func checkCurrentBodyCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength) \n하체근력: \(lowerBodyStrength) \n근지구력: \(muscularEndurance) \n피로도: \(fatigue)")
        print("--------------")
    }
}
