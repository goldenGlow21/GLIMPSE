class Idol {
  String _name = '블랙핑크';
  // get 키워드를 사용해 게터임을 명시
  // 게터는 매개변수 X
  String get name {
    return this._name;
  }
  // set 키워드를 사용해 세터임을 명시
  // 세터는 매개변수로 딱 하나의 변수를 받을 수 있다.
  set name(String name) {
    this._name = name;
  }
}
void main() {
  Idol blackPink = Idol();
  blackPink.name = '에이핑크';
  print(blackPink.name);
  // 헷갈리면 안되는 게 get과 set은 실제 사용하는 함수 이름이 아니다!
  // 프라이빗 변수를 사용했기 때문에 .name과 겹칠 일은 존재하지 않는다.
  // blackPink.name만 적어도 게터로 바로 작용하는 걸 확인할 수 있다.
  // blackPink.name = '에이핑크'라고 수정하는 것만 적어도 세터로 바로 작용하는 걸 확인할 수 있다

  // 실행결과
  // 에이핑크
}