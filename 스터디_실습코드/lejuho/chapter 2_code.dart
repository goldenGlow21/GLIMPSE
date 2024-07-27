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

void main() {
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
}
