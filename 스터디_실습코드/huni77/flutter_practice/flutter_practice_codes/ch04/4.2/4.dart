void main() {
  final Pokemon pikachu = Pokemon('피카츄', 20);

  // 클래스의 생성자 구조와 똑같이 구조 분해하면 된다.
  final Pokemon (name:name, level:level) = pikachu;

  print(name);

  print(level);
}

class Pokemon {
  final String name;
  final int level;

  Pokemon(this.name, this.level);
}

