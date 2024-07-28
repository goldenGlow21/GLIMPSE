void main() {
  List<String> pokeList = ['잠만보', '피카츄', '메타몽', '뮤'];

  final newPokeList = pokeList.map(
        (name) => '포켓몬 $name',  // 리스트의 모든 값 앞에 ‘포켓몬’을 추가
  );
  print(newPokeList);

  // Iterable을 List로 다시 변환하고 싶을 때 .toList() 사용
  print(newPokeList.toList());
}
