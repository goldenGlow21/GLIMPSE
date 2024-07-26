void main() {
  try{
    final String name = 'noah';
    throw Exception('이름이 잘못됨');
    print(name);
  }
  catch(e){
    print(e);
  }
}