import 'phase_1_func.dart';
import 'dart:async';

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

  Lee juho = Lee('주호', 100);
  juho.sayName();
  juho.countMoney();

  print("\n");

  Kim Bob = Kim('밥', 200);
  Bob.sayName();
  Bob.countMoney();
  print(Bob.private);

  print("\n");

  Hong Gildong = Hong("길동", 10000);
  Gildong.sayName();
  Gildong.countMoney();

  print("\n");

  Siu siu = Siu("GOAT", 1000);
  siu.Exer();

  print("\n");

  tiger mask = tiger("predator", 5);
  mask.takeShape();
  mask.roar();

  print("\n");

  final cache = Cache<List<int>>(data: [1, 2, 3]);

  print(cache.data.reduce((value, element) => value + element));

  print("\n");

  Counter count1 = Counter();
  Counter count2 = Counter();
  Counter count3 = Counter();

  print("\n");

  Siu GOAT = Siu('또 당신입니까', 1) // 케스케이드 연산자
    ..sayName()
    ..countMoney();

  Future<String> name_another; // 미래에 받을 String값
  Future<int> number; // " int값
  Future<bool> isOpened; // " bool값

  addNumbers(1, 1);
// 결과
// 1+1 계산 시작!
// 1+1 코드 실행 끝
// 1+1 = 2

//************************************************** */

  addNumbers2(1, 1);
  addNumbers2(2, 2);
// 결과
// 1+1 계산시작!
// 2+2 계산시작!
// 1+1 = 2
// 1+1 코드 실행 끝
// 2+2 = 4
// 2+2 코드 실행 끝

  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();

  final streamListener1 = stream.listen((val) {
    print('listening 1');
    print(val);
  });

  final streamListener2 = stream.listen((val) {
    print('listening 2');
    print(val);
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
// 출력
// listening 1
// 1
// listening 2
// 1
// listening 1
// 2
// listening 2
// 2
// listening 1
// 3
// listening 2
// 3

  playStream();
  // 출력
  // i=0
  // i=1
  // i=2
  // i=3
  // i=4

  (String, int) minji = ('민지', 20);
  (String, int, bool) haerin = ('해린', 20, true);

  print(minji); // ('민지',20);
  print(haerin.$1); // 해린

  ({String name, int age}) minji2 = (name: '민지', age: 20);

// 리스트에서의 구조분해
// 3줄을 1줄로 줄일 수 있다
// final newJeans = ['민지','해린'];
// final minji = newJeans[0];
// final haerin = newJeans[1];
  final [minji_a, haerin_a] = ['민지', '해린'];

  print(minji_a); // 민지

//-------------------------------
// 리스트에서 구조분해 (스프레드연산자 "..." 사용)
  final numbers_a = [1, 2, 3, 4, 5, 6, 7, 8];

  final [x, y, ..., z] = numbers;

  print(x); // 1
  print(y); // 2
  print(z); // 8

//------------------------------
// 맵에서 구조분해
  final minjiMap = {'name': '민지', 'age': 20};

  final {'name': name_b, 'age': age} = minjiMap; // name과 age라는 변수를 선언 후 각각 초기화

  print('name:$name_b'); // 민지
  print('age:$age'); // 20

//------------------------------
// 클래스에서 구조분해

  final minji_3 = Idol(name: '민지', age: 20);

  final Idol(name: name_c, age: age_a) = minji_3;

  print(name_c); // 민지
  print(age_a); // 20

  String dayKor = '월요일';

  String dayEnglish = switch (dayKor) {
    '월요일' => 'Monday',
    '화요일' => 'Tuesday',
    '수요일' => 'Wednesday',
    '목요일' => 'Thursday',
    '금요일' => 'Friday',
    '토요일' => 'Saturday',
    '일요일' => 'Sunday',
    _ => 'Not Found',
  };

  print(dayEnglish); // Monday

  switcher('aaa'); // match: aaa
  switcher([1, 2]); // match: [1,2]
  switcher([3, 4, 5]); // match: [_,_,_]
  switcher([6, 7]); // match: [int 6,int 7]
  switcher(('민지', 19)); // match: (String 민지, int 19)
  switcher(8); // no match

  bool? val;

  switch (val) {
    // null 조건이 없어서 non exhaustive switch statement 에러 발생
    case true:
      print('true');
    case false:
      print('false');
  }
  ;

  (int a, int b) val2 = (1, -1);

  switch (val2) {
    // 출력: default
    case (1, _) when val2.$2 > 0:
      print('1,_');
      break;
    default:
      print('default');
  }
}
