class Idol {
  // '_'로 변수명을 시작하면 프라이빗 변수 선언 가능
  String _name;
  Idol(this._name);
}
void main() {
  Idol blackPink = Idol('블랙핑크');
  print(blackPink._name);
}