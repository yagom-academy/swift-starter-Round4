import Foundation

class BodyCondition {
    var 상체근력: Int {
        didSet {
            print("근력 변화량: \(oldValue) -> \(상체근력)")
        }
    }
    var 하체근력: Int {
        didSet {
            print("근력 변화량: \(oldValue) -> \(하체근력)")
        }
    }
    var 근지구력: Int {
        didSet {
            print("근력 변화량: \(oldValue) -> \(근지구력)")
        }
    }
    var 피로도: Int {
        didSet {
            while 피로도 > 100 {
                피로도 += -1
            }
            print("피로도 변화량: \(oldValue) -> \(피로도)")
        }
    }
    
    init(상체근력: Int, 하체근력: Int, 근지구력: Int, 피로도: Int) {
        self.상체근력 = 상체근력
        self.하체근력 = 하체근력
        self.근지구력 = 근지구력
        self.피로도 = 피로도
    }
    
    func currentBodyCondition() {
        print(MagicNumber.blankPage)
        print("""
            -----------
            현재의 컨디션은 다음과 같습니다.
            상체근력: \(상체근력)
            하체근력: \(하체근력)
            근지구력: \(근지구력)
            피로도: \(피로도)
            -----------
            """)
    }
}

