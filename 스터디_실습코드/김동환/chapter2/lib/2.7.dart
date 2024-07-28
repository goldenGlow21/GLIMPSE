// 추상 키워드 abstract
abstract class Idol {
  final String name;
  final int membersCount;

  // 생성자 선언
  Idol(this.name, this.membersCount);

  // 추상메서드 선언
  void sayName();
  void sayMembersCount();
}

class GirlGroup implements Idol {
  final String name;
  final int membersCount;

  GirlGroup(
      this.name,
      this.membersCount,
      );
  void sayName() {
    print('저는 여자 아이돌 ${this.name}입니다.');
  }
  void sayMembersCount() {
    print('${this.name} 멤버는 ${this.membersCount}명입니다.');
  }
}

void main() {
  GirlGroup blackPink = GirlGroup('블랙핑크', 4);
  blackPink.sayName();
  blackPink.sayMembersCount();
}

/*
실행결과
저는 여자 아이돌 블랙핑크입니다.
블랙핑크 멤버는 4명입니다.
 */