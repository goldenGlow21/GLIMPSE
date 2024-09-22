class StickerModel {
  final String id; // 스티커 고유 id
  final String imgPath; // 스티커 이미지 경로값

  // 생성자 함수
  StickerModel({
    required this.id,
    required this.imgPath,
});
  @override
  bool operator ==(Object other) { // == 로 같은지 비교할 때 사용되는 로직
    // 하나의 인스턴스가 다른 인스턴스와 같은지 비교할 때 사용
    // ID 값이 같은 인스턴스끼리는 같은 스티커로 인식
    return (other as StickerModel).id == id;
  }

  // Set 등 해시값을 사용하는 데이터 구조에서 사용하는 Getter
  // ID 값이 같으면 Set 안에서 같은 인스턴스로 인식
  @override
  int get hashCode => id.hashCode;
}