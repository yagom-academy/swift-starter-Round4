import Foundation

func checkHasProblem(input: String, bool: Bool) -> Bool {
    do {
        try checkInputHasCommonError(input: input, InputMustContainOnlyNumber: true)
        inputHasProblem = false
    } catch commonError.quit {
        print("강제종료 합니다.")
        exit(0)
    } catch commonError.containSpecialCharacter {
        print("특수문자를 포함하지 마세요")
        inputHasProblem = true
    } catch commonError.containNotNumber {
        print("숫자만 입력해주세요")
        inputHasProblem = true
    } catch {
        print("알 수 없는 오류가 발생했습니다. 종료합니다")
        exit(0)
    }
}
