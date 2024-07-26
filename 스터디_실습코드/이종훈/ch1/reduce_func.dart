void main(){
	List<String> teamList = ['noah', 'kyle', 'june', 'terry'];

	final newList = teamList.reduce((value, element) => value + ', ' + element);

	print(newList);    // 리스트의 멤버인 문자열 형태로 반환
}