void main(){
	List<String> teamList = ['noah', 'kyle', 'june', 'terry'];

	final newList = teamList.map(
		(name) => 'BT $name'    // 리스트의 값들 앞에 BT 추가
	);

	print(newList);    // 이터러블이 반환
	print(newList.toList());    // 이터러블을 다시 리스트 형태로 변환
}