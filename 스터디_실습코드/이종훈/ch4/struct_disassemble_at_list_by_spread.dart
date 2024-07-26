void main() {

  final numbers = [1, 2, 3, 4, 5, 6, 7, 8];
  final [x, y, ..., z] = numbers;
  print(x);
  print(y);
  print(z);
}