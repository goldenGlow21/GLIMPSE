import 'dart:async';

void main() {
  final controller = StreamController();
  final stream = controller.stream;

  // Stream에 listen() 함수를 실행하면 값이 주입될 때마다 콜백함수를 실행할 수 있다.
  final streamLListener1 = stream.listen((val) {
    print(val);
  });

  // Stream에 값을 주입하기
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
}

/*
실행결과
1
2
3
4
 */