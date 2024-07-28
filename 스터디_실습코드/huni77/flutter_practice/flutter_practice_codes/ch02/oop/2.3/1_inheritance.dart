class PokemonTrainer {
  final String name;
  final int membersCount;

  PokemonTrainer(this.name, this.membersCount);

  void sayName() {
    print('저는 ${this.name}입니다.');
  }

  void sayMembersCount() {
    print('${this.name} 멤버는 ${this.membersCount}명입니다.');
  }
}

// ❶ extends 키워드를 사용해서 상속받습니다.
// class 자식 클래스 extends 부모 클래스 순서입니다.
class PokemonMaster extends PokemonTrainer {
  final int age; // 자식 클래스에서 새로운 멤버변수 선언

  // ❷ 상속받은 생성자
  PokemonMaster(
      String name,
      int membersCount,
      {this.age = 10} // 생성자에서 age 변수 초기화, default 값 0
      ) :  super(   // super는 부모 클래스를 지칭합니다. 부모 클래스에서 name, membersCount 상속받았다.
    name,
    membersCount,
  );

  // ❸ 상속받지 않은 기능
  void sayMale() {
    print('저는 남자 포켓몬 마스터 입니다.');
  }

  void sayAge() {
    print('저는 ${age}살 입니다.');
  }
}

void main() {

  PokemonMaster group1 = PokemonMaster('로켓단', 7);  // 생성자로 객체 생성
  PokemonMaster group2 = PokemonMaster('플라즈마단', 10, age: 20); // default 값 대신에 전달하려면 age : 이렇게 해야함

  group1.sayName();          // ❶ 부모한테 물려받은 메서드
  group1.sayMembersCount();  // ❷ 부모한테 물려받은 메서드
  group1.sayMale();          // ❸ 자식이 새로 추가한 메서드
  group1.sayAge();
  print("");
  group2.sayName();          // ❶ 부모한테 물려받은 메서드
  group2.sayMembersCount();  // ❷ 부모한테 물려받은 메서드
  group2.sayMale();          // ❸ 자식이 새로 추가한 메서드
  group2.sayAge();

}
