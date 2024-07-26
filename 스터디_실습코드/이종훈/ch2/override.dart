class GirlGroup extends Idol {
  GirlGroup(
      super.name,
      super.membersCount,
      );

  @override
  void sayName() {
    print('저는 여자 아이돌 ${this.name}입니다');
  }
}

void main() {
  GirlGroup redVelvet = GirlGroup('블랙핑크', 4);
  redVelvet.sayName();
  redVelvet.sayMembersCount();
}