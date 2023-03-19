//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by tom on 2023/03/15.
//

import Foundation


final class Routine {
    let name: String
    var activities : [Activity]
    
    init(name: String, activities: [Activity]) {
        self.name = name
        self.activities = activities
    }
    ///피로도
    func fatigueError(condition: BodyCondition) {
        do {
            try fatigueCheck(fatigue:condition)
        } catch ActivityError.overFatigueError { // 밑에 함수 받으면 에러 메시지
            print("피로도가 100(이/가)이 넘어 운동진행 불가")
        } catch {
            print(error)
        }
    }
    
    private func fatigueCheck(fatigue: BodyCondition) throws {
        guard fatigue.fatigue < 100 else { //피로도 100 넘으면 에러던지기
            throw ActivityError.overFatigueError
        }
    }
    
    ///리드라인
    func mistakenInputError(test: [Activity], test1: BodyCondition) {
        do {
            for i in test {
                try routineCount(test: i, test1: test1) }
        } catch ActivityError.inputError {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            mistakenInputError(test: test, test1: test1)  // 본인을 호출한이유 do에 함수 실행시키기    // 여기서 1.5일?
        } catch {
            print(error)
        }
    }
    
    func routineCount(test: Activity, test1: BodyCondition) throws {
        print("루틴을 몇 번 반복할까요? :")
        let input = readLine()! // 생성
        guard let intInput = Int(input) else {throw ActivityError.inputError} // 인트로변경하고 변경되면 포문 안되면 에러
        for index in 1...intInput {
            print("---------------루틴 포문")
            print("\(index) 번째 hellRoutine을(를) 시작합니다.")
            print("<<\(test.name)을(를) 시작합니다.>>루틴 포문")
            test.action(test1)
//            activities.append(test)
//            activities
//            print("뭐가 어펜드 되냐 \(activities)") ?? 이러면 이 프로퍼티를 안쓰느데 흠..
        }
//        return activities
    }
}


