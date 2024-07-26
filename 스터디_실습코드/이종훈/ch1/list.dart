void main(){
	List<String> teamList = ['noah', 'kyle', 'june', 'terry'];

	print(teamList);    //전체 출력
	print(teamList[0]); // 특정 원소 출력
	print(teamList.length);   // 길이 반환

	teamList[2] = 'finka';    // 2번 인덱스 원소 변경
}