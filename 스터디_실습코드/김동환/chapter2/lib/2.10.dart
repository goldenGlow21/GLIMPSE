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
void main() {
  // 캐스케이드 연산자 (..) 사용
  // 선언한 변수의 메서드를 연속으로 실행가능
  // 조금 더 코드를 간결하게 사용할 수 있다.

  /*
  Idol blackPink = Idol('블랙핑크', 4)
  blackPink.sayName();
  blackPink.sayMembersCount();
   */
  // 위의 코드와 같은 일을 하지만 아래 코드가 좀 더 간결한 것을 확인할 수 있다.
  Idol blackPink = Idol('블랙핑크', 4)
      ..sayName()
      ..sayMembersCount();
}