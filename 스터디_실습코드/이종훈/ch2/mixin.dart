mixin IdolSingMixin on Idol{
  void sing(){
    print('${this.name}이 노래를 부릅니다');
  }
}

class BoyGroup extends Idol with IdolSingMixin{
  BoyGroup(
      super.name,
      super.membersCount,
      );

  void sayMale() {
    print('저는 남자 아이돌입니다');
  }
}

void main(){
  BoyGroup bts = BoyGroup('BTS', 7);
  bts.sing();
}