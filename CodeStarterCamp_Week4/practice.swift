//
//  practice.swift
//  CodeStarterCamp_Week4
//
//  Created by MARY on 2023/03/14.
//

import Foundation

// MARK: - closure
func closure() {
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    var reverseNames: [String]

    // ******** 1: 일반적인 방법, 함수를 생성
//    func backward(_ s1: String, _ s2: String) -> Bool {
//        return s1 > s2
//    }
//    reverseNames = names.sorted(by: backward(_:_:))
    // ******** 2: 클로저 기본 문법
//    reverseNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
//        return s1 > s2
//    })
    // ******** 3: 타입 추론
//    reverseNames = names.sorted(by: { s1, s2 in return s1 > s2 })
    // ******** 4: 단일 표현 클로저에서의 암시적 반환
//    reverseNames = names.sorted(by: { s1, s2 in s1 > s2 })
    // ******** 5: 인자 이름 축약
//    reverseNames = names.sorted(by: { $0 > $1 })
    // ******** 6: 연산자 메소드
    reverseNames = names.sorted(by: >)
    print(reverseNames)
}

// MARK: - higher-order function
func higherOrderFunction() {
    let numbers: [Int] = [0, 1, 2, 3, 4]
    var doubledNumbers: [Int]
    var strings: [String]
    
    // numbers의 각 요소를 2배하여 새로운 배열 반환
    doubledNumbers = numbers.map({ (number: Int) -> Int in
        return number * 2
    })
    print(doubledNumbers)
    // 매개변수, 반환타입, 반환 키워드 생략, 후행 클로저
    doubledNumbers = numbers.map { $0 * 2 }
    print(doubledNumbers)
    // numbers의 각 요소를 문자열로 변환하여 새로운 배열 반환
    strings = numbers.map({ (number: Int) -> String in
        return "\(number)"
    })
    print(strings)
    // 매개변수, 반환타입, 반환 키워드 생략, 후행 클로저
    strings = numbers.map { "\($0)" }
    print(strings)
    
    var evenNumbers: [Int]
    // numbers의 요소 중 짝수를 걸러내어 새로운 배열로 반환
    evenNumbers = numbers.filter { (number: Int) -> Bool in
        return number % 2 == 0
    }
    print(evenNumbers)
    // 매개변수, 반환타입, 반환 키워드 생략, 후행 클로저
    evenNumbers = numbers.filter { $0 % 2 == 0 }
    print(evenNumbers)
    
    let someNumbers: [Int] = [2, 8, 15]
    // 초깃값이 0이고 someNumbers 내부의 모든 값을 더합니다.
    let sum: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
//        print("\(first) + \(second)") //어떻게 동작하는지 확인해보세요
        return first + second
    })
    print(sum)
    let sum2: Int = someNumbers.reduce(3) { $0 + $1 }
    print(sum2)
}
