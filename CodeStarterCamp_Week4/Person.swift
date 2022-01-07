//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by song on 2022/01/04.
//

import Foundation

class Person {
    var name: String
    var exerciseSuccess: Bool
    init(name: String) {
        self.name = name
        self.exerciseSuccess = true
    }
    enum PersonError : Error {
        case inputError
        case notEnoughStrength
    }
    
    
    func choiseRoutine() throws {
        print("어떤 루틴으로 운동하시겠어요? 1번상체 2번하체")
        guard let choiseRoutin = readLine() else { return }
        guard let choiseRoutinInt = Int(choiseRoutin) else { return print("잘못입력하셨습니다.") }
        guard choiseRoutinInt == 1 || choiseRoutinInt == 2 else {
            throw PersonError.inputError
        }
        if choiseRoutinInt == 1 {
            print("상체루틴 실행")
            do{
                try   routineUpperBodyExcercises(routine: upperBodyExcercises, bodyCondition: bodyCondition)
            }catch PersonError.inputError {
                print("잘못입력하셨습니다.")
            }catch PersonError.notEnoughStrength {
                print("""
                  목표치에 도달하지 못했습니다. 현제 \(person.name)님의 컨디션은
                  상체근력:\(bodyCondition.upperbodystrength)
                  하체근력:\(bodyCondition.lowerbodystrength)
                  근지구력:\( bodyCondition.muscularendurance)
                  """)
            } catch { }
       exerciseSuccess = bodyCondition.upperbodystrength < goalsBodyCondition.upperbodystrength
            || bodyCondition.lowerbodystrength < goalsBodyCondition.lowerbodystrength
            || bodyCondition.muscularendurance < goalsBodyCondition.muscularendurance
        }
        else if choiseRoutinInt == 2 {
            print("하체루틴 실행")
            do{
                try  routineLowerBodyExcercises(routine: lowerBodyExcercises, bodyCondition: bodyCondition)
            }catch PersonError.inputError{
                print("잘못입력하셨습니다.")
            }catch PersonError.notEnoughStrength {
                print("""
                  목표치에 도달하지 못했습니다. 현제 \(person.name)님의 컨디션은 다음입니다
                  상체근력:\(bodyCondition.upperbodystrength)
                  하체근력:\(bodyCondition.lowerbodystrength)
                  근지구력:\( bodyCondition.muscularendurance)
                  """)
            } catch { }
       exerciseSuccess =  bodyCondition.upperbodystrength < goalsBodyCondition.upperbodystrength
            || bodyCondition.lowerbodystrength < goalsBodyCondition.lowerbodystrength
            || bodyCondition.muscularendurance < goalsBodyCondition.muscularendurance
             }
    }
    
    
    func routineUpperBodyExcercises(routine: Routine, bodyCondition: BodyCondition) throws {
        print("몇세트를 하시겠습니까")
        guard let set = readLine() else { return }
        guard let set = Int(set) else { return print("잘못입력하셨습니다.") }
        guard set > 0 else {
            throw PersonError.inputError
        }
        
        var routineCount = 0
        while routineCount < set {
            routineCount += 1
            print("upperBodyExcercises을 \(routineCount)set시작합니다.")
            do{
                try routine.startUpperBodyExcercises()
            } catch Routine.ExcercisesError.fatigueOver {
                print("\(person.name)님의 피로도가 \(bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
                break
            } catch{}
        }
        
        guard bodyCondition.upperbodystrength > goalsBodyCondition.upperbodystrength || bodyCondition.lowerbodystrength > goalsBodyCondition.lowerbodystrength || bodyCondition.muscularendurance > goalsBodyCondition.muscularendurance else {
            throw PersonError.notEnoughStrength
        }
        print("성공입니다! 현재 \(person.name)님의 컨디션은 다음과 같습니다.")
        bodyCondition.nowCondition ()
    }
    
    
    func routineLowerBodyExcercises(routine: Routine, bodyCondition: BodyCondition) throws{
        print("몇세트를 하시겠습니까")
        guard let strenth = readLine() else { return }
        guard let set = Int(strenth) else { return print("잘못입력하셨습니다.") }
        guard set > 0 else {
            throw PersonError.inputError
        }
        var routineCount = 0
        while routineCount < set {
            routineCount += 1
            
            print("LowerBodyExcercises을 \(routineCount)set시작합니다.")
            do{
                try routine.startLowerBodyExcercises()
            } catch Routine.ExcercisesError.fatigueOver {
                print("\(person.name)님의 피로도가 \(bodyCondition.fatigue)입니다. 회원님이 도망갔습니다.")
                break
                
            } catch{}
        }
        guard bodyCondition.upperbodystrength > goalsBodyCondition.upperbodystrength || bodyCondition.lowerbodystrength > goalsBodyCondition.lowerbodystrength || bodyCondition.muscularendurance > goalsBodyCondition.muscularendurance else {
            throw PersonError.notEnoughStrength
        }
        print("성공입니다! 현재 \(person.name)님의 컨디션은 다음과 같습니다.")
        bodyCondition.nowCondition ()
    }
    
    func excerciseLoop() {
        repeat{
            do{
                try   person.choiseRoutine()
              
            }catch PersonError.inputError{
                print("잘못입력하셨습니다.")
            }catch{}
        }while exerciseSuccess && bodyCondition.fatigue < goalsBodyCondition.fatigue
     
        
        if bodyCondition.fatigue > goalsBodyCondition.fatigue {
            print("byebyebyebyebyebyebyebyebyebyebyebyebyebyebyebyebyebyebyebyebyebyebyebyebyebyebye")
        }
        else {
            print("""
              목표치에 도달하여 운동을 끝냅니다.현제 \(person.name)님의 컨디션은 다음입니다.
              상체근력:\(bodyCondition.upperbodystrength)
              하체근력:\(bodyCondition.lowerbodystrength)
              근지구력:\( bodyCondition.muscularendurance)
              """)
            
        }
    }
}
