int addTwoNumbers1(int a, int b) {
  return a + b;
}
int addTwoNumbers2({
  required int a,
  required int b,
}) {
  return a + b;
}
int addTwoNumbers3({
  required int a,
  int b = 2,
}) {
  return a + b;
}
int addTwoNumbers4(
    int a, {
      required int b,
      int c = 4,
    }) {
  return a + b + c;
}

typedef Operation = void Function(int x, int y);

void add(int x, int y) {
  print('결괏값 : ${x + y}');
}

void subtract(int x, int y) {
  print('결괏값 : ${x - y}');
}
void calculate(int x, int y, Operation oper) {
  oper(x, y);
}
// terminal에서 dart lib/main.dart 명령어 실행
void main() {
  /*
// 한줄 주석
/**/ 여러 줄 주석
/// 문서주석
 */

  // print() 함수 : 문자열을 콘솔에 출력
  print('Hello World');

  // var : 변수에 값이 들어가면 자동으로 타입 결정
  // var 변수명 = 값;
  var name = "김동환";
  print(name);
  // 값 변경가능
  name = "브레이든";
  print(name);
  // 대신 변수명 중복 불가능
  // 한번 변수타입이 정해지면 다른 타입으로 변경 불가

  // var은 한번 입력하면 타입이 고정
  // dynamic은 타입이 고정되지 않음
  dynamic name1 = "김동환";
  print(name1);
  name1 = 1;
  print(name1);

  // final, const
  // 둘 다 값을 변경할 수 없게끔 만드는 키워드
  // final은 런타임, const는 빌드 타임 상수이디ㅏ.
  // 코드를 실행하지 않은 상태에서 값이 확정되면? const
  // 코드를 실행할 때 확정되면? final 사용
  final String name2 = '블랙핑크';
  // name2 = "BTS"; // 에러발생
  const String name3 = 'BTS';
  // name3 = '블랙핑크'; // 에러발생

  // 변수타입
  // dynamic이나 var로 타입을 알아서 정할 수 있지만
  // 변수타입을 명시해주면 코드가 더 직관적으로 보인다.
  // String - 문자열
  String a = '김동환';
  // int - 정수
  int b = 1;
  // double - 실수
  double c = 0.5;
  // bool - 불리언
  bool d = true;

  Set<String> alpha = {'a', 'b', 'c'};
  print(alpha);
  print(alpha.contains('a'));
  print(alpha.toList());
  print(alpha);
  List<String> beta = ['a', 'b'];
  print(Set.from(beta));

  double number = 2;
  print(number + 2);
  print(number - 2);
  print(number * 2);
  print(number / 2);
  print(number % 3);

// 단항연산자도 가능
  number++;
  print(number);
  --number;
  print(number);
  number--;
  print(number);
  ++number;
  print(number);
  number += 2;
  print(number);
  number -= 2;
  print(number);
  number *= 2;
  print(number);
  number /= 2;
  print(number);

  double? number1 = 1;
  number1 = null; // 정상작동;

  double? number3; // 자동으로 null값 저장
  print(number3); // null

  number3 ??= 3; // 기존 값이 null인 경우에만 값이 저장
  print(number3); // 3

  number3 ??= 4; // 기존 값이 null이 아니므로 값이 저장되지 않음
  print(number3); // 3

  int num0 = 1;
  int num1 = 2;

  print(num0 > num1);
  print(num0 < num1);
  print(num0 >= num1);
  print(num0 <= num1);
  print(num0 == num1);
  print(num0 != num1);

  int num2 = 1;
  print(num2 is int);
  print(num2 is String);
  print(num2 is! int);
  print(num2 is! String);

  print(addTwoNumbers1(1, 2)); // 3
  print(addTwoNumbers2(a : 1, b : 2)); // 3
  print(addTwoNumbers3(a : 1)); // 3
  print(addTwoNumbers4(1, b : 3, c : 7)); // 11

  List<int> numbers = [1, 2, 3, 4, 5];

  final allMembers = numbers.reduce((value, element) {
    return value + element;
  });
  print(allMembers);

  List<int> numbers1 = [1, 2, 3, 4, 5];

  final allMembers1 = numbers.reduce((value, element) => value + element);
  print(allMembers1);

  // typedef는 일반적 변수의 type처럼 사용가능
  Operation oper = add;
  oper(1, 2);

  // subtract() 함수도 Operation에 해당되는 시그니처이므로 oper변수에 저장 가능
  oper = subtract;
  oper(1, 2);
  calculate(1, 2, add);

  try {
    // 에러가 없을 때 실행할 로직
    final String name = '브레이든';
    print(name); // 에러가 없으니 출력됨
  }catch(e) { // catch는 첫 번째 매개변수에 에러 정보를 전달해줌.
    // 에러가 있을 때 실행할 로직
    print(e);
  }
  /*
실행결과 : 브레이든
왜? 에러가 나지 않았으니 catch문이 실행되지 않고 브레이든이 출력됨.
*/
  try{
    final String name = '브레이든';
    // throw 키워드로 고의적으로 에러를 발생시킨다.
    throw Exception('이름이 잘못됐습니다!');
    print(name);
  } catch(e) {
    // try에서 에러가 발생했으니 catch 로직이 실행된다.
    print(e);
  }
/*
실행결과 : Exception: 이름이 잘못됐습니다!
*/
}



