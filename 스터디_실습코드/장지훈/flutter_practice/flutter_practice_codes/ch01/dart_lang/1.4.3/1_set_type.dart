void main() {
  Set<String> pokeList = {'잠만보', '피카츄', '메타몽', '뮤','잠만보'}; // ➊ 잠만보 중복

  print(pokeList);
  print(pokeList.contains('피카츄')); // ➋ 값이 있는지 확인하기
  print(pokeList.toList());         // ➌ 리스트로 변환하기

  List<String> pokeList2 = ['잠만보', '뮤', '뮤'];
  print(Set.from(pokeList2));  // ➍ List 타입을 Set 타입으로 변환
}
