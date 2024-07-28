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

mixin IdolSingMixin on Idol {
  void sing() {
    print('${this.name}이 노래를 부릅니다.');
  }
}
// 믹스인 적용시에는 with 키워드 사용
class BoyGroup extends Idol with IdolSingMixin {
  BoyGroup(
      super.name,
      super.membersCount,
      );
  void sayMale() {
    print('저는 남자 아이돌입니다.');
  }
}
void main() {
  BoyGroup bts = BoyGroup('BTS', 7);
  // 믹스인에 정의된 sing() 함수 사용 가능
  bts.sing();
}