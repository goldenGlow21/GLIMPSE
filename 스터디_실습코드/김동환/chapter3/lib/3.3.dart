void main() async{
  await addNumbers(1, 1);
  await addNumbers(2, 2);
}

// async 키워드는 함수 매개변수 정의와 바디 사이에 입력한다.
Future<void> addNumbers(int number1, int number2) async {
  print('$number1 + $number2 계산 시작!');

  // await는 대기하고 싶은 비동기 함수 앞에 입력한다.
  await Future.delayed(Duration(seconds: 3), (){
    print('$number1 + $number2 = ${number1 + number2}');
  });

  print('$number1 + $number2 코드 실행 끝');
}

/*
실행결과
1 + 1 계산 시작!
1 + 1 = 2
1 + 1 코드 실행 끝
2 + 2 계산 시작!
2 + 2 = 4
2 + 2 코드 실행 끝
 */