void main() async {
  await addNumbers(1, 1);
  await addNumbers(2, 2);
}

// async는 함수 매개변수 정의와 바디 사이에 입력
Future<void> addNumbers(int number1, int number2) async {
  print('$number1 + $number2 계산 시작!');

  // await는 대기하고 싶은 비동기 함수 앞에 입력
  await Future.delayed(Duration(seconds: 3), (){
    print('$number1 + $number2 = ${number1 + number2}');
  });

  print('$number1 + $number2 코드 실행 끝');
}