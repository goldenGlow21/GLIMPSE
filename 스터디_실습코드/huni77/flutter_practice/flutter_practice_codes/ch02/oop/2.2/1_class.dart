// class 키워드를 입력 후 클래스명을 지정해 클래스를 선언합니다.
class Pokemon {
  // ❶ 클래스에 종속되는 변수를 지정할 수 있습니다.
  String name = '잠만보';

  // ❷ 클래스에 종속되는 함수를 지정할 수 있습니다.
  // 클래스에 종속되는 함수를 메서드라고 부릅니다.
  void sayName() {

    // ❸ 클래스 내부의 속성을 지칭하고 싶을 때는 this 키워드를 사용하면 됩니다.
    // 결과적으로 this.name은 Idol 클래스의 name 변수를 지칭합니다.
    print('저는 ${this.name}입니다.');
    // ➍ 스코프 안에 같은 속성 이름이 하나만 존재한다면 this를 생략할 수 있습니다.
    print('저는 $name입니다.');
  }
}

void main() {

  Pokemon poke1 = Pokemon();  // ➊ Pokemon 인스턴스 생성

  // 메서드를 실행합니다.
  poke1.sayName();
}
