/*void main() {
// 아래 코드와 같지만 구조분해를 사용하면 한 줄에 해결할 수 있다.
*//*
final newJeans = ['민지', '해린'];
final minji = newJeans[0];
final haerin = newJeans[1];
*//*
  final [minji, haerin] = ['민지', '해린'];

// 민지 출력
  print(minji);
// 해린 출력
  print(haerin);
}*/

/*
void main() {
  final numbers = [1, 2, 3, 4, 5, 6, 7, 8];
  // 스프레드 연산자를 사용하게 되면 중간값들을 버릴 수 있다.
  final [x, y, ..., z] = numbers;

  // 1 출력
  print(x);
  // 2 출력
  print(y);
  // 8 출력
  print(z);
}*/

/*
void main() {
  final minjiMap = {'name' : '민지', 'age' : 19};
// 위의 맵의 구조와 똑같은 구조로 구조 분해하면 된다.
  final {'name' : name, 'age' : age} = minjiMap;

// name : 민지
  print('name : $name');
// age : 19
  print('age : $age');
}*/

void main() {
  final minji = Idol(name : '민지', age : 19);
  // 클래스의 생성자 구조와 똑같이 구조 분해하면 된다.
  final Idol(name : name, age : age) = minji;

  // 민지 출력
  print(name);
  // 19 출력
  print(age);
}

class Idol {
  final String name;
  final int age;

  Idol({
    required this.name,
    required this.age ,
});
}