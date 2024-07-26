class Idol {
  String _name= '블랙핑크' ;

  String get name {
    return this._name;
  }

  set name(String name) {
    this._name = name;
  }
}

void main() {
  Idol blackPink = Idol();
  blackPink.name = '에이핑크';
  print(blackPink.name);
}