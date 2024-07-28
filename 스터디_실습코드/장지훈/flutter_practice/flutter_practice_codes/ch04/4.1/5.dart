void main() {
  // Named Parameter 형태로 Record를 선언하는 방법이다.
  // 다른 Named Parameter와 마찬가지로 순서는 상관이 없어진다.
  ({String name, int level}) pokemon = (name: '잠만보', level: 99);

  // (age: 20, name: 민지) 출력
  print(pokemon);
}
