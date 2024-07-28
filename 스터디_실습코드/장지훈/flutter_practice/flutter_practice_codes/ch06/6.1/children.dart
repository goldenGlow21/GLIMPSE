import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 생성자
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: ListView(
            children: [
              Text('hello'),
              Text('world'),
              Text('ha'),
              Text('Ha'),
              Text('hA'),
              Text('HA'),
              Text('1'),
              Text('2'),
              Text('3'),
              Text('잠만보'),
              Text('피카츄'),
              Text('라이츄'),
              Text('파이리'),
              Text('꼬부기'),
              Text('버터풀'),
              Text('야도란'),
              Text('피죤투'),
              Text('또가스'),
              Text('서로 생긴 모습은 달라도'),
              Text('우리는 모두 친구'),
              Text('산에서 들에서'),
              Text('때리고 뒹굴고'),
              Text('사막에서 정글에서 울다가 웃다가'),
              Text('서로 만나기까지 힘들었어도'),
              Text('우리는 모두 친구'),
              Text('울랄랄라 내가 원하는 건 너도 원하고'),
              Text('마주 잡은 두 손에 맹세해'),
              Text('힘을 내봐 그래 힘을 내봐'),
              Text('용기를 내봐 그래 용기를 내봐'),
              Text('world'),
              Text('world'),
              Text('world'),
              Text('world'),
              Text('world'),
              Text('world'),
              Text('world'),
              Text('world'),
              Text('world'),
            ],
          ),
        ),
      ),
    );
  }
}