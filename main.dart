class AddOperation {
  func perform(_ a: Double, _ b: Double) -> Double {
    return a + b
  }//덧셈 연산자
}
class SubtractOperation {
  func perform(_ a: Double, _ b: Double) -> Double {
    return a - b
  }//뺄셈 연산자
}
class MultiplyOperation {
  func perform(_ a: Double, _ b: Double) -> Double {
    return a * b
  }//곱셈 연산자
}
class DivideOperation {
  func perform(_ a: Double, _ b: Double) -> Double? {
    if b != 0 {
      return a / b
    } else {
      print("오류: 0으로는 나눌 수 없습니다.")
      return nil
    }
  }//나눗셈연산자, 0으로 나눌 시 오류 표기
}
class Calculator {
  var operation: Any? = nil
  func setOperation(_ operation: Any) {
    self.operation = operation
  }
  func calculate(_ a: Double, _ b: Double) -> Double? {
    if let operation = operation as? AddOperation {
      return operation.perform(a, b)
    } else if let operation = operation as? SubtractOperation {
      return operation.perform(a, b)
    } else if let operation = operation as? MultiplyOperation {
      return operation.perform(a, b)
    } else if let operation = operation as? DivideOperation {
      return operation.perform(a, b)
    } else {
      print("No valid operation set")
      return nil
    }
  }
}
let calculator = Calculator()
calculator.setOperation(AddOperation())
if let result = calculator.calculate(1, 8) {
  print(result) // 출력: 8
}
calculator.setOperation(SubtractOperation())
if let result = calculator.calculate(3, 4) {
  print(result) // 출력: -1
}
calculator.setOperation(DivideOperation())
if let result = calculator.calculate(3, 0) {
  print(result) // 출력: -1
}