abstract class Idol {
  //변수
  final String name;
  final int membersCount;

  //생성자
  Idol(this.name, this.membersCount);

  //추상 메소드
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
    print('저는 여자 아이돌 ${this.name}입니다');
  }

  void sayMembersCount() {
    print('${this.name} 멤버는 ${this.membersCount}명입니다.');
  }
}