class Idol {
  final String name;
  final int membersCount;

  Idol(this.name, this.membersCount); // 부모클래스 생성자

  // 부모클래스 메서드(자식도 사용가능)
  void sayName() {
    print('저는 ${this.name}입니다.');
  }
  // 부모클래스 메서드(자식도 사용가능)
  void sayMembersCount() {
    print('${this.name} 멤버는 ${this.membersCount}명입니다.');
  }
}
// implements 키워드를 사용하여 원하는 클래스를 인터페이스로 사용가능
class GirlGroup implements Idol {
  final String name;
  final int membersCount;
  GirlGroup(
      this.name,
      this.membersCount,
      );
  // 모든 부모 메서드 다시 재정의
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