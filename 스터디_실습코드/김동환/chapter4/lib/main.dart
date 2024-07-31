/*void main() {
// 정확한 위치에 어떤 타입의 값이 입력될지 지정할 수 있다.
// (String, int)는 첫 번째 값은 String 타입이고 두 번째 값은 int 타입이다.
  (String, int) minji = ('민지', 20);
// ('민지', 20) 출력
  print(minji);
}*/

// 실행결과
// (민지, 20)

/*
void main() {
// Invalid Assignment 에러
  (String, int) minji = (20, '민지');
  print(minji);
}
// 실행결과
// 에러 발생*/

/*void main() {
  (String, int, bool) minji = ('민지', 20, true);
// (민지, 20, true)
  print(minji);
}*/

/*
void main() {
  (String, int, bool) minji = ('민지', 20, true);
// 민지
  print(minji.$1);
// 20
  print(minji.$2);
// true
  print(minji.$3);
}*/

void main() {
  // 네임드 파라미터 형태로 Record를 선언하는 방법이다.
  // 다른 네임드 파라미터와 마찬가지로 순서는 상관없다.
  ({String name, int age}) minji = (name: '민지', age : 20);

  // (age : 20, name : 민지) 출력
  print(minji);
}