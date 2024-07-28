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

class BoyGroup extends Idol { // Idol 클래스 상속
  BoyGroup(
      String name,
      int membersCount,
      ) : super(
    name,
    membersCount,
  ); // BoyGroup의 생성자는 Idol 생성자와 같다 라는 의미
  // super : 부모클래스(Idol 클래스) 지칭
  // 자식클래스에만 있는 메서드
  void sayMale() {
    print('저는 남자아이돌입니다.');
  }
}

void main() {
  BoyGroup bts = BoyGroup('BTS', 7);
  bts.sayName();
  bts.sayMembersCount();
  bts.sayMale();
}