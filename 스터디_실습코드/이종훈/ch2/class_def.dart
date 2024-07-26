class Idol {
  String name = '블랙핑크';    // 변수

  void sayName() {    // 메소드
    print('저는 ${this.name}입니다.');
    print('저는 $name입니다.');
  }
}

void main() {
  Idol blackPink = Idol();
  blackPink.sayName();
}