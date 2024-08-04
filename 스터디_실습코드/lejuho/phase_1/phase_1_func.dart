import 'dart:async';

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

class Lee {
  final String name;
  final int money;

  Lee(this.name, this.money);

  void sayName() {
    print("저는 이${this.name}입니다.");
  }

  void countMoney() {
    print("${this.money}원 남았습니다.");
  }
}

class Kim extends Lee {
  // 상속
  String _private = "이건 다른 파일에서 접근 불가"; // 프라이빗 변수

  Kim(String name, int money) : super(name, money);

  String get name {
    return super.name;
  }

  set name(String name) {
    // 세터
    this.name = name;
  }

  String get private {
    // 게터
    return this._private;
  }

  @override // 오버라이드
  void sayName() {
    print("저는 김${this.name}입니다.");
  }
}

class Hong implements Lee {
  // 인터페이스
  final String name;
  final int money;

  Hong(this.name, this.money);

  void sayName() {
    print("father를 father라 부르지 못하고");
  }

  void countMoney() {
    print("bro를 bro라 부르지 못하네");
  }
}

mixin LeeExerMixin on Lee {
  // 믹스인
  void Exer() {
    print("${this.name}이(가) 운동을 합니다");
  }
}

class Siu extends Lee with LeeExerMixin {
  Siu(super.name, super.money);
  @override
  void sayName() {
    print("${this.name},GOAT");
  }

  @override
  void countMoney() {
    print("그저 ${this.money}등, 나의 빛");
  }
}

abstract class Animal {
  // 추상 클래스
  final String shape;
  final int count;

  Animal(this.shape, this.count);

  void takeShape();
  void roar();
}

class tiger implements Animal {
  final String shape;
  final int count;

  tiger(this.shape, this.count);

  void takeShape() {
    print("호랑이");
  }

  void roar() {
    print("으르렁");
  }
}

class Cache<T> {
  // 제네릭
  final T data;

  Cache({required this.data});
}

class Counter {
  static int i = 0; // 스태틱

  Counter() {
    print(i++);
  }
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

void addNumbers(int number1, int number2) {
  print('$number1 + $number2 계산 시작!');

  Future.delayed(Duration(seconds: 3), () {
    print('$number1 + $number2 = ${number1 + number2}');
  });

  print('$number1 + $number2 코드 실행 끝');
}

Future<void> addNumbers2(int number1, int number2) async {
  print('$number1 + $number2 계산 시작!');

  await Future.delayed(Duration(seconds: 3), () {
    print('$number1 + $number2 = ${number1 + number2}');
  });

  print('$number1 + $number2 코드 실행 끝');
}

Stream<String> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield 'i=$i';
    await Future.delayed(Duration(seconds: 1));
  }
}

void playStream() {
  calculate(1).listen((val) {
    print(val);
  });
}

class Idol {
  final String name;
  final int age;

  Idol({
    required this.name,
    required this.age,
  });
}

void switcher(dynamic anything) {
  switch (anything) {
    case 'aaa':
      print('match: aaa');
      break;
    case [1, 2]:
      print('match: [1,2]');
      break;
    case [_, _, _]:
      print('match: [_,_,_]');
      break;
    case [int a, int b]:
      print('match: [int $a,int $b]');
      break;
    case (String a, int b):
      print('match: (String $a,int $b)');
      break;
    default:
      print('no match');
  }
}

base class Parent {}

Parent parent = Parent(); // 인스턴스화 가능

base class Child extends Parent {} // 가능

class Child2_a extends Parent {} // 앞에 base / sealed / final 제한자 중 하나 필요

class Child3_b implements Parent {} // 불가

//-----------------------------------------
// final calss Parent{}로 선언되었다면

Parent parent_a = Parent(); // 가능

class Child_a extends Parent {} // 불가

class Child2_b implements Parent {} // 불가

//------------------------------------------
// interface class Parent{}로 선언되었다면

Parent parent_b = Parent(); // 가능

class Child_b extends Parent {} // 불가

class Child_c implements Parent {} // 가능

//----------------------------------------
// sealed class Parent{}로 선언되었다면

Parent parent_c = Parent(); // 불가

class Child_d extends Parent {} // 불가

class Child_e implements Parent {} // 불가

//-------------------------------------
// mixin의 경우

mixin class MixinExample {}

class Child1 extends MixinExample {}

class Child2 with MixinExample {}
