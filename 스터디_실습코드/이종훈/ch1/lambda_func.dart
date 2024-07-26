void main() {
  List<int> numbers = [1,2,3,4,5];
  final allMembers = numbers.reduce((value, element) => value + element);
  print(allMembers);
}