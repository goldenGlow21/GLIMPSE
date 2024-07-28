class Pokemon {
  // ❶ '_'로 변수명을 시작하면
  // 프라이빗 변수를 선언할 수 있습니다.
  String _name;

  Pokemon(this._name);
}

void main() {
  Pokemon poke1 = Pokemon('잠만보');

  // 같은 파일에서는 _name 변수에 접근할 수 있지만
  // 다른 파일에서는 _name 변수에 접근할 수 없습니다.
  print(poke1._name);
}
