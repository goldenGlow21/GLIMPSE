void main() {
  List<String> pokeList = ['잠만보', '피카츄', '메타몽', '뮤'];

  final allMembers = pokeList.reduce((value, element) => value + ', ' + element);  // ➊ 리스트를 순회하며 값들을 더합니다.

  print(allMembers);
}
