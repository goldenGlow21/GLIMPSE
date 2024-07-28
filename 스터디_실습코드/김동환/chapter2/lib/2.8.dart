// 인스턴스화 할 때 입력받을 타입을 T로 지정
class Cache<T> {
  // data의 타입을 추후 입력될 T 타입으로 지정
  final T data;

  Cache({
    required this.data,
});
}

void main() {
  // T의 타입을 List<int>로 입력한다.
  final cache = Cache<List<int>>(
    data: [1, 2, 3],
  );
  // 제네릭에 입력된 값을 통해 data 변수의 타입이 자동으로 유추
  print(cache.data.reduce((value, element) => value + element));
}
// 실행결과
// 6