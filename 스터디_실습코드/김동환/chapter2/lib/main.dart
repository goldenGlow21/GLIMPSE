class Idol {
  final String name;
  final int membersCount;

  Idol(String name, int membersCount) // 기본생성자
      : this.name = name,
        this.membersCount = membersCount;
  Idol.fromMap(Map <String, dynamic> map) // 네임드생성자(이름있는 생성자)
// 클래스명.네임드 생성자명 (형식)
      : this.name = map['name'],
  this.membersCount = map['membersCount'];
  void sayName() {
  print('저는 ${this.name}입니다. ${this.name}멤버는 ${this.membersCount}명입니다.');
  }
}

void main() {
// 기본생성자 사용
  Idol blackPink = Idol('블랙핑크', 4);
  blackPink.sayName();
// fromMap이라는 네임드 생성자 사용
  Idol bts = Idol.fromMap({
    'name': 'BTS',
    'membersCount': 7,
  });
  bts.sayName();
}
// 실행결과
// 저는 블랙핑크입니다. 블랙핑크 멤버는 4명입니다.
// 저는 BTS입니다. BTS멤버는 7명입니다.