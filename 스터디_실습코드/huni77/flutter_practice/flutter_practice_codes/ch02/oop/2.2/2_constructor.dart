class Pokemon {
  // ❶ 생성자에서 입력받는 변수들은 일반적으로 final 키워드 사용
  final String name;

  // ❷ 생성자 선언
  // 클래스와 같은 이름이어야 합니다.
  // 함수의 매개변수를 선언하는 것처럼 매개변수를 지정해줍니다.
  Pokemon(String name) : this.name = name;

  void sayName() {
    print('저는 ${this.name}입니다.');
  }
}

void main() {
  // name에 '잠만보' 저장
  Pokemon poke1 = Pokemon('잠만보');
  poke1.sayName();

  // name에 '피카츄' 저장
  Pokemon poke2 = Pokemon('피카츄');
  poke2.sayName();
}
