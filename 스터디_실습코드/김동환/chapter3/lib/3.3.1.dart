void main() async{
  final result = await addNumbers(1, 1);
  print('결괏값 $result'); // 일반 함수와 동일하게 반환값을 받을 수 있음
  final result2 = await addNumbers(2, 2);
  print('결괏값 $result2');
}

Future<int> addNumbers(int number1, int number2) async {
  print('$number1 + $number2 계산 시작!');

  // await는 대기하고 싶은 비동기 함수 앞에 입력한다.
  await Future.delayed(Duration(seconds: 3), (){
    print('$number1 + $number2 = ${number1 + number2}');
  });

  print('$number1 + $number2 코드 실행 끝');

  return number1 + number2;
}

/*
실행결과
1 + 1 계산 시작!
1 + 1 = 2
1 + 1 코드 실행 끝
결괏값 2
2 + 2 계산 시작!
2 + 2 = 4
2 + 2 코드 실행 끝
결괏값 4
 */