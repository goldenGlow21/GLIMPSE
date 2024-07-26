void main(){
	List<String> teamList = ['noah', 'kyle', 'june', 'terry'];

	final newList = teamList.where(
		(name) => name == 'noah' || name == 'kyle',
	);

	print(newList);    // 이터러블이 반환
	print(newList.toList());    // 이터러블을 다시 리스트 형태로 변환
}