import 'dart:async';

void main() {
  final controller = StreamController();

  // 여러 번 리슨할 수 있는 Broadcast Stream 객체 생성
  final stream = controller.stream.asBroadcastStream();

  // 첫 번째 listen() 함수
  final streamListener1 = stream.listen((val) {
    print('listening 1');
    print(val);
  });

  // 두 번째 listen() 함수
  final streamListener2 = stream.listen((val) {
    print('listening 2');
    print(val);
  });

  // add()를 실행할 때마다 listen()하는
  // 모든 콜백 함수에 값이 주입된다.
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
}

/*
실행결과
listening 1
1
listening 2
1
listening 1
2
listening 2
2
listening 1
3
listening 2
3
*/