//
//  BodyConditon.swift
//  CodeStarterCamp_Week4
//
//  Created by 서진 on 2022/11/12.
//

import Foundation

class BodyCondition {
    var 상체근력: Int = 0 {
        didSet(oldValue) {
            print("상체근력이 \(상체근력 - oldValue) 상승합니다.")
        }
    }
    
    var 하체근력: Int = 0 {
        didSet(oldValue) {
            print("하체근력이 \(하체근력 - oldValue) 상승합니다.")
        }
    }
    
    var 근지구력: Int = 0 {
        didSet(oldValue) {
            print("근지구력이 \(근지구력 - oldValue) 상승합니다.")
        }
    }
    
    var 피로도: Int = 0 {
        didSet(oldValue) {
            if 피로도 > oldValue {
                print("피로도가 \(피로도 - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - 피로도) 하락합니다.")
            }
        }
    }
    
    func nowBodyCondition() {
        print("""
                --------------
                현재의 컨디션은 다음과 같습니다.
                상체근력: \(상체근력)
                하체근력: \(하체근력)
                근지구력: \(근지구력)
                피로도: \(피로도)
                -------------\n
                """)
    }
}
