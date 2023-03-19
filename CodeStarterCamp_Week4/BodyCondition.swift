//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by JSB on 2023/03/13.
//

import Foundation

class BodyCondition {
    
    var 상체근력: Int {
        didSet {
            print("상체근력이 \(self.상체근력 - oldValue) 상승합니다.")
        }
    }
    
    var 하체근력: Int {
        didSet {
            print("하체근력이 \(self.하체근력 - oldValue) 상승합니다.")
        }
    }
    
    var 근지구력: Int {
        didSet {
            print("근지구력이 \(self.근지구력 - oldValue) 상승합니다.")
        }
    }
    
    var 피로도: Int {
        didSet {
            if self.피로도 > oldValue {
                print("피로도가 \(self.피로도 - oldValue) 상승합니다.")
            } else if self.피로도 < oldValue {
                print("피로도가 \(oldValue - self.피로도) 감소합니다.")
                if self.피로도 < 0 {
                    self.피로도 = 0
                }
            } else {
                print("피로도 변화가 없습니다.")
            }
        }
    }
    
    init(상체근력: Int, 하체근력: Int, 근지구력: Int, 피로도: Int) {
        self.상체근력 = 상체근력
        self.하체근력 = 하체근력
        self.근지구력 = 근지구력
        self.피로도 = 피로도
    }
    
    func checkBodyCondition () {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(self.상체근력)")
        print("하체근력: \(self.하체근력)")
        print("근지구력: \(self.근지구력)")
        print("피로도: \(self.피로도)")
    }
}
