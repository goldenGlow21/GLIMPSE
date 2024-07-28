// Future.delayed()를 사용해서 실습(특정 기간 동안 아무것도 하지 않고 기다리는 기능)

void main() {
  addNumbers(1, 1);
}

void addNumbers(int number1, int number2) {
  print('$number1 + $number2 계산 시작!');
  // 1. Future.delayed()를 사용하면 일정 시간 후에 콜백함수를 실행할 수 있다.
  Future.delayed(Duration(seconds: 3), (){
    print('$number1 + $number2 = ${number1 + number2}');
  });

  print('$number1 + $number2 코드 실행 끝');
}

/*
실행결과
1 + 1 계산 시작!    // 2
1 + 1 코드 실행 끝  // 3
1 + 1 = 2         // 4
 */

/*
1. 첫 번째 매개변수에 대기할 기간을 입력하고 두 번째 매개변수에 대기 후 실행할 콜백함수를 입력한다.
addNumbers() 함수는 print() 함수를 실행하고 Future.delayed()를 통해 3초간 대기한다.
그다음 마지막 print() 함수를 실행하고 함수를 마친다. 순서는 2, 4, 3이라고 생각할 수 있으나
Future.delayed()는 비동기 연산이기 때문에 리소스를 허비하지 않고 다음코드를 바로 실행한다.
그래서 2, 3, 4 순서대로 값을 출력한다. CPU가 아무것도 하지 않는 시간동안 다른 작업을 하여 효율적으로
CPU 리소스를 사용한것이다.
 */
