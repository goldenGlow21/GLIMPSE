import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  static final LatLng companyLatLng = LatLng(
    // 1. 지도 초기화 위치
    37.642597,
    126.931206,
  );

  // 목적지 위치 마커 선언
  static final Marker marker = Marker(
    markerId: MarkerId('company'),
    position: companyLatLng,
  );
  static final Circle circle = Circle(
    circleId: CircleId('choolCheckCircle'),
    center: companyLatLng,
    // 원의 중심이 되는 위치, LatLng 값을 제공한다.
    fillColor: Colors.blue.withOpacity(0.5),
    // 원의 색상
    radius: 100,
    // 원의 반지름 (미터 단위)
    strokeColor: Colors.blue,
    // 원의 테두리 색
    strokeWidth: 1, // 원의 테두리 두께
  );

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: FutureBuilder<String>(
        future: checkPermission(),
        builder: (context, snapshot) {
          // 1. 로딩 상태
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // 2. 권한 허가된 상태
          if (snapshot.data == '위치 권한이 허가 되었습니다.') {
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: companyLatLng,
                      zoom: 16,
                    ), // 확대 정도
                    myLocationEnabled: true, // 내 위치 지도에 보여주기
                    markers: Set.from([marker]),
                    circles: Set.from([circle]),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timelapse_outlined,
                      color: Colors.blue,
                      size: 50.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final curPosition =
                            await Geolocator.getCurrentPosition(); // 현재 위치
                        final distance = Geolocator.distanceBetween(
                          curPosition.latitude, // 현재 위치 위도
                          curPosition.longitude, // 현재 위치 경도
                          companyLatLng.latitude, // 목적지 위치 위도
                          companyLatLng.longitude, // 목적지 위치 경도
                        );

                        bool canCheck = distance < 100; // 100미터 이내에 있으면 출근 가능
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text('출근하기'),
                              // 출근 가능 여부에 따라 다른 메시지 제공
                              content: Text(
                                canCheck ? '출근을 하시겠습니까?' : '출근할 수 없는 위치입니다.',
                              ),
                              actions: [
                                TextButton(
                                  // 취소를 누르면 false 반환
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text('취소'),
                                ),
                                // 출근 가능할 때만 '출근하기' 버튼 제공
                                if (canCheck)
                                  TextButton(
                                    // 출근하기를 누르면 true 반환
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: Text('출근하기'),
                                  )
                              ],
                            );
                          },
                        );
                      },
                      child: Text('출근하기'),
                    ),
                  ],
                ))
              ],
            );
          }

          // 3. 권한 없는 상태
          return Center(
            child: Text(
              snapshot.data.toString(),
            ),
          );
        },
      ),
    );
  }

  AppBar renderAppBar() {
    // AppBar 구현하는 함수
    return AppBar(
      centerTitle: true,
      title: Text(
        '오늘도 출첵',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    // 위치 서비스 활성화 여부 확인
    if (!isLocationEnabled) {
      return '위치 서비스를 활성화해주세요';
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission();

    // 위치 권한 확인
    if (checkedPermission == LocationPermission.denied) {
      // 위치 권한 거절되었을 때
      // 위치 권한 요청하기
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        return '앱의 위치 권한을 설정에서 허가해주세요';
      }
    }

    // 위치 권한 거절됨 (앱에서 재 요청 불가)
    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 설정에서 허가해 주세요';
    }

    // 위 모든 조건이 통과되면 위치 권한 허가 완료
    return '위치 권한이 허가 되었습니다.';
  }
}
