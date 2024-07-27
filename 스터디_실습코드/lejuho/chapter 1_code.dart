enum Status {
  approved,
  pending,
  rejected,
}

int add({
  required int a,
  required int b,
}) {
  return a + b;
}

typedef Operation(int x, int y);

void sum(int x, int y) {
  print('결괏값 : ${x + y}');
}

void sub(int x, int y) {
  print('결괏값 : ${x - y}');
}

void cal(int x, int y, oper) {
  oper(x, y);
}

void main() {
  //한 줄 주석

/* 
* 여러 줄
* 주석은
* 이렇게
*/

  /// 슬래시 3개는 문서 주석, DartDoc이나 안드로이드 스튜디오 같은 IDE에서 문서로 인식

  var name = '코드팩토리';
  print(name);

//변수값 변경 가능
  name = '골든래빗';
  print(name);

// 변수명 중복 불가
// 다음 코드에서 주석 제거 시 에러 발생
// var name = '김고은';

  dynamic name1 = '코드팩토리';
  name1 = 1; // 정상 작동

  var tmp = '시험';
// tmp = 1;
// 위 주석 제거 시 에러 발생

  final String bp = "blackpink";
// bp = 'BTS';

  const String name2 = "BTS";
// name2 = "blackpink";
// 위 2개의 초기화 코드 모두 주석 제거 시 에러 발생

  final DateTime now = DateTime.now();
  print(now); //정상 작동

//const DateTime now2 = DateTime.now();
// print(now2);
// 위 주석 2줄 제거 시 에러 발생

// String - 문자열
  String s = '코드팩토리';

// int - 정수
  int isInt = 10;

// double - 실수
  double isDouble = 2.5;

// bool - 불리언 (true/false)
  bool isTrue = true;

  print(name); // 코드팩토리
  print(isInt); // 10
  print(isDouble); // 2.5
  print(isTrue); // true

  List<String> blackpinkList = ['리사', '지수', '제니', '로제'];

  print(blackpinkList); // 한꺼번에 출력
  print(blackpinkList[1]); // 인덱스로 지정 출력, 출력 결과는 "지수"

  print(blackpinkList.length); // List의 길이 반환, 출력 결과는 4

  print(Set.from(blackpinkList)); // Set으로 변환

  blackpinkList.add('코드팩토리'); // ['리사','지수','제니','로제','코드팩토리']

  final newList = blackpinkList.where(
    (name) => name == '리사' || name == '지수',
  ); // newList는 ('리사','지수')가 되고, 이 형태는 리스트가 아니기 때문에 리스트로 바꿔주려면 toList()를 사용해야 함
//ex) tmp = newList.toList(); 를 실행시 tmp = ['리사','지수']

  final newBlackpink = blackpinkList.map(
    (name) => '블랙핑크 $name',
  ); // ['블랙핑크 리사','블랙핑크 지수','블랙핑크 제니','블랙핑크 로제']

  final allMembers =
      blackpinkList.reduce((value, element) => value + ',' + element);
// '리사, 지수, 제니, 로제'를 반환,전체 리스트를 순환하며 value와 element의 값이 변함
// value의 값은 '리사'-> '리사, 지수' -> '리사, 지수, 제니' -> '리사, 지수, 제니, 로제'가 된다.

  final allMembers2 =
      blackpinkList.fold(0, (value, element) => value + element.length);
// 8을 반환, reduce와 다른 점을 fold에서는 인자를 람다함수외에 하나를 더 입력받고 그 값을 첫번째 실행값으로 넣어
// 한번 실행 후 실행한 값을 두번째부터 활용한다는 점이다.

  Map<String, String> dictionary = {
    'Harry Potter': '해리 포터',
    'Ron Wisley': '론 위즐리',
    'Hermione Granger': '헤르미온느 그레인저',
  };

  print(dictionary['Harry Potter']); // 키로 접근, 출력 결과는 '해리 포터'

  print(dictionary
      .keys); // 모든 키 반환, 출력 결과는 (Harry Potter, Ron Wisley, Hermione Granger)
  print(dictionary.values); // (해리 포터, 론 위즐리, 헤르미온느 그레인저)

  Set<String> blackpink = {
    '로제',
    '지수',
    '리사',
    '제니',
    '제니'
  }; // 실제 저장되는 집합은 {'로제','지수','리사','제니'}

  print(blackpink.contains('로제')); // 값 존재 여부를 불리언 값으로 반환, 출력결과는 true
  print(blackpink.toList()); // List로 변환

  Status status = Status.approved;
  print(status); // 출력 결과는 Status.approved

// ? 명시로 null값 가능
  double? num1 = 1;

// 주석 제거 시 에러 발생
//double num2 = null;

// 자동으로 null
  double? num3;

  num3 ??= 3; // 전 값이 null이므로 3으로 변경

  num3 ??= 4; // 전 값이 null이 아닌 3이므로 3유지

  int number1 = 1;

  print(number1 is int); // true
  print(number1 is! int); // !이 붙을 경우 반대값 반환, 출력: false

  print(add(a: 1, b: 2));

  List<int> numbers = [1, 2, 3, 4, 5];

// 익명 함수의 형식
  final allmembers = numbers.reduce((value, element) {
    return value + element;
  });

// 람다 함수의 형식
  final allmembers2 = numbers.reduce((value, element) => value + element);

  Operation oper = sum;
  oper(1, 2); // 결괏값 : 3

  oper = sub;
  oper(1, 2); // 결괏값 : -1

  cal(3, 2, sum); // 결괏값 : 5
}
