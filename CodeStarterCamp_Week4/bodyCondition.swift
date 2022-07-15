//
//  bodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by hanjongwoo on 2022/07/15.
//

import Foundation

class BodyCondition {
    func adjustValue() {
        
    }
}

class 상체근력: BodyCondition {
    let name = "상체근력"
    static var value: Int = 0 {
        didSet(oldNum) {
            let num = self.value - oldNum
            if num > 0 {
                print("상체근력이 \(num) 상승합니다.")
            } else if num == 0 {
                print("상체근력이 변하지 않았습니다.")
            } else {
                print("상체근력이 \(abs(num)) 하락합니다.")
            }
        }
    }
    let minimumValue: Int
    let maximumValue: Int
    
    init(_ minimumValue: Int, _ maximumValue: Int) {
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
    }
    
    override func adjustValue() {
        상체근력.value += Int.random(in: minimumValue...maximumValue)
    }
}

class 하체근력: BodyCondition {
    let name = "하체근력"
    static var value: Int = 0 {
        didSet(oldNum) {
            let num = self.value - oldNum
            if num > 0 {
                print("하체근력이 \(num) 상승합니다.")
            } else if num == 0 {
                print("하체근력이 변하지 않았습니다.")
            } else {
                print("하체근력이 \(abs(num)) 하락합니다.")
            }
        }
    }
    let minimumValue: Int
    let maximumValue: Int
    
    init(_ minimumValue: Int, _ maximumValue: Int) {
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
    }
    
    override func adjustValue() {
        하체근력.value += Int.random(in: minimumValue...maximumValue)
    }
}

class 근지구력: BodyCondition {
    let name = "근지구력"
    static var value: Int = 0 {
        didSet(oldNum) {
            let num = self.value - oldNum
            if num > 0 {
                print("근지구력이 \(num) 상승합니다.")
            } else if num == 0 {
                print("근지구력이 변하지 않았습니다.")
            } else {
                print("근지구력이 \(abs(num)) 하락합니다.")
            }
        }
    }
    let minimumValue: Int
    let maximumValue: Int
    
    init(_ minimumValue: Int, _ maximumValue: Int) {
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
    }
    
    override func adjustValue() {
        근지구력.value += Int.random(in: minimumValue...maximumValue)
    }
}

class 피로도: BodyCondition {
    let name = "피로도"
    static var value: Int = 0 {
        didSet(oldNum) {
            let num = self.value - oldNum
            if num > 0 {
                print("피로도가 \(num) 상승합니다.")
            } else if num == 0 {
                print("피로도가 변하지 않았습니다.")
            } else {
                print("피로도가 \(abs(num)) 하락합니다.")
            }
        }
    }
    let minimumValue: Int
    let maximumValue: Int
    
    init(_ minimumValue: Int, _ maximumValue: Int) {
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
    }
    
    override func adjustValue() {
        피로도.value += Int.random(in: minimumValue...maximumValue)
    }
}
