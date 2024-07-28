void main() {
  final pokemon = {'name': '잠만보','level':90};
  // Map의 구조와 똑같은 구조로 Destructuring하면 된다.
  final {'name': name, 'level': level} = pokemon;

  // name: 잠만보
  print('name: $name');

  // level: 90
  print('level: $level');
}
