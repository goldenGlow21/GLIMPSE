void main() {
  List<String> pokeList = ['잠만보', '피카츄', '메타몽', '뮤'];

  final newList = pokeList.where(
        (name) => name == '잠만보' || name == '메타몽', // pokeList에서 '잠만보' '메타몽' 뺴고 다 삭제함
  );

  print(newList);
  print(newList.toList()); // Iterable을 List로 다시 변환할 때  .toList() 사용
}
