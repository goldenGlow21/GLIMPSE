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
    print('${this.name} 멤버는 ${this.membersCount}명입니다');
  }
}