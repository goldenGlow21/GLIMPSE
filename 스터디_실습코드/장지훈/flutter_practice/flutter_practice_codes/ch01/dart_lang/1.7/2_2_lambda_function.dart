void main() {
  List<int> numbers = [1,2,3,4,5];

  // 람다 함수로 모든 값 더하기
  final allMembers = numbers.reduce((value, element) => value + element);

  print(allMembers);
}
