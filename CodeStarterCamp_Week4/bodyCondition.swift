//
//  bodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by song on 2021/12/29.
//

import Foundation

struct BodyCondition {
  var upperbodystrength :Int
  var lowerbodystrength :Int
  var muscularendurance :Int
  var fatigue :Int
  func nowCondition() {
    print("---------------")
    print("현제의 컨디션은 다음과 같습니다.")
    print("상체근력: \(upperbodystrength)")
    print("하체근력: \(lowerbodystrength)")
    print("근지구력: \(muscularendurance)")
    print("피로도:  \(fatigue)")
  }
}

//
//
//do {
//    try 오류 발생 가능코드
//    오류가 발생하지 않으면 실행할 코드
//} catch 오류 패턴 1 {
//    처리 코드
//} catch 오류 패턴 2 {
//    처리 코드
//}
//
//
//
//do {
//    try orderSoda(amount: 3, machine: machine)
//} catch VendingMachineError.insufficientFunds {
//    print("돈 모자람")
//} catch VendingMachineError.outOfStock {
//    print("재고 부족")
//}
