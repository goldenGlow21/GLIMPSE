
class Pokemon {
  String _name= '잠만보' ;

  // ❶ get 키워드를 사용해서 게터임을 명시합니다.
  // 게터는 메서드와 다르게 매개변수를 전혀 받지 않는다.
  String get getName {
    return this._name;
  }

  // ❷ 세터는 set이라는 키워드를 사용해서 선언합니다.
  // 세터는 매개변수로 딱 하나의 변수를 받을 수 있습니다.
  set setName(String name) {
    this._name = name;
  }
}

void main() {
  Pokemon poke1 = Pokemon();

  poke1.setName = '메타몽'; // ❶ 세터
  print(poke1.getName);      // ❷ 게터
}
