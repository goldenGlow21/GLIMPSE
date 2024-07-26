void main(){
	List<String> teamList = ['noah', 'kyle', 'june', 'terry'];

	final newList = teamList.fold<int>(0, (value, element) => value + element.length);

	print(newList);
}