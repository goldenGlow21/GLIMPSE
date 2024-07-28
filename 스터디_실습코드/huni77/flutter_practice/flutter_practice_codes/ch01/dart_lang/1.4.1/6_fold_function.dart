void main() {
  List<String> pokeList = ['잠만보', '피카츄', '메타몽', '뮤'];

  // ➊ reduce() 함수와 마찬가지로 각 요소를 순회하며 실행됩니다.
  final allMembers =
  pokeList.fold<int>(0, (value, element) => value + element.length);

  print(allMembers); // pokeList 안에 있는 포켓몬들의 이름 글자수의 총합 출력
  // 3 + 3 + 3 + 1 = 10
}
