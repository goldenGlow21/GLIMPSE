import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              // 빨간색 Container
              Container(
                height: 300.0,
                width: 300.0,
                color: Colors.red,
              ),

              // 노란색 Container
              Container(
                height: 250.0,
                width: 250.0,
                color: Colors.yellow,
              ),

              // 파란색 Container
              Container(
                height: 200.0,
                width: 200.0,
                color : Colors.blue,
              )
            ],
          ), // 여기에 예제 코드 작성하기
        ),
      ),
    );
  }
}

/*void main() {
  runApp(ColumnWidgetExample());
}

class ColumnWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(

          // 반대축에서 이동할 공간을 제공해주기 위해 너비를 최대한으로 설정
          width: double.infinity,
          child: Column(

            // 주축 정렬 지정
            mainAxisAlignment: MainAxisAlignment.start,

            // 반대축 정렬 지정
            crossAxisAlignment: CrossAxisAlignment.center,

            // 넣고 싶은 위젯 입력
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),

              // SizedBox는 일반적으로 공백을 생성할 때 사용
              const SizedBox(width: 12.0,),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.green,
              ),
              const SizedBox(width: 12.0,),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

/*void main() {
  runApp(RowWidgetExample());
}

class RowWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(

          // 반대축에서 이동할 공간을 제공하기 위해 높이를 최대한으로 설정
          height: double.infinity,
          child: Row(

            // 주축 정렬 지정
            mainAxisAlignment: MainAxisAlignment.start,
            // 반대축 정렬 지정
            crossAxisAlignment: CrossAxisAlignment.center,

            // 넣고 싶은 위젯 입력
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),

              // SizedBox는 일반적으로 공백을
              // 생성할 때 사용
              const SizedBox(width: 12.0,),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.green,
              ),
              const SizedBox(width: 12.0,),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          child: SafeArea(
            // 원하는 부위만 따로 적용가능
            // true는 적용 false는 미적용
            top: false,
            bottom: false,
            left: false,
            right: false,
            child: Container(
              color: Colors.red,
              height: 300.0,
              width: 300.0,
            ),
          ), // 여기에 예제 코드 작성하기
        ),
      ),
    );
  }
}*/

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 3. 최상위 검정 컨테이너(margin이 적용되는 대상)
          child: Container(
            color: Colors.black,

            // 2. 중간 파란 컨테이너
            child: Container(
              color: Colors.blue,

              // 마진 적용 위치
              margin: EdgeInsets.all(16.0),

              // 패딩 적용
              child: Padding(
                padding: EdgeInsets.all(16.0),

                // 1. 패딩이 적용된 빨간 컨테이너
                child: Container(
                  color: Colors.red,
                  width:  50,
                  height: 50,
                ),
              ),
            ),
          ), // 여기에 예제 코드 작성하기
        ),
      ),
    );
  }
}*/


/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.blue,
            child: Padding(

              // 상하, 좌우로 모두 16픽셀만큼 패딩 적용
              padding: EdgeInsets.all(
                16.0,
              ),
              child: Container(
                color: Colors.red,
                width: 50.0,
                height: 50.0,
              ),
            ),
          ), // 여기에 예제 코드 작성하기
        ),
      ),
    );
  }
}
*/

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            // 스타일 작용
            decoration: BoxDecoration(
              // 배경색 적용
              color: Colors.red,
              // 테두리 적용
              border: Border.all(
                // 테두리 굵기
                width: 16.0,
                // 테두리 색상
                color: Colors.black,
              ),
              // 모서리 둥글게 만들기
              borderRadius: BorderRadius.circular(
                  16.0,
              ),
            ),
            // 높이
            height: 200.0,
            // 너비
            width: 100.0,
          ), // 여기에 예제 코드 작성하기
        ),
      ),
    );
  }
}*/

/*void main() {
  runApp(FloatingActionButtonExample());
}

class FloatingActionButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          // 클릭했을 때 실행할 함수
          onPressed: () {},
          child: Text('클릭'),
        ),
        body: Container(),
      ),
    );
  }
}*/

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            // 1. 한 번 탭했을 때 실행할 함수
            onTap: (){
              // 출력결과는 안드로이드 스튜디오의 [Run] 탭에서 확인 가능
              print('on tap');
            },
            // 2. 두 번 탭했을 때 실행할 함수
            onDoubleTap: (){
              print('on double tap');
            },
            // 3. 길게 눌렀을 때 실행할 함수
            onLongPress: (){
              print('on long press');
            },
            // 제스처를 적용할 위젯
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: 100.0,
              height: 100.0,
            ),
          ), // 여기에 예제 코드 작성하기
        ),
      ),
    );
  }
}*/

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              // 플러터에서 기본으로 제공하는 아이콘
              // https://fonts.google.com/icons 에서 아이콘 확인 가능
              Icons.home,
            ),
          ), // 여기에 예제 코드 작성하기
        ),
      ),
    );
  }
}*/

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            // 클릭 시 실행할 함수
            onPressed: () {},
            // 버튼 스타일링
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            // 버튼에 들어갈 위젯
            child: Text('엘리베이티드 버튼'),
          ), // 여기에 예제 코드 작성하기
        ),
      ),
    );
  }
}*/

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            // 클릭 시 실행
            onPressed: () {},
            // 스타일 지정
            style: TextButton.styleFrom(
              // 주색상 지정
              foregroundColor: Colors.red,
            ),
            child: Text('텍스트 버튼'),
          ), // 여기에 예제 코드 작성하기
        ),
      ),
    );
  }
}*/

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            // 작성하고 싶은 글
            '코드팩토리',
            // 글자에 스타일 적용
            style: TextStyle(
              // 글자 크기
              fontSize: 16.0,
              // 글자 굵기
              fontWeight: FontWeight.w700,
              // 글자 색상
              color: Colors.blue,
            ),
          ), // 여기에 예제 코드 작성하기
        ),
      ),
    );
  }
}*/

// chapter 6.1

/*void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            // 여러 위젯을 Column 위젯에 입력 가능
            children: [
              Text('Code'),
              Text('Factory'),
            ],
          ),
        ),
      ),
    ),
  );
}*/

/*void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          // 하나의 위젯만 가운데 정렬 가능
          child: Text('Code Factory'),
        ),
      ),
    ),
  );
}*/

/*
void main() {
  runApp(
      MaterialApp(  // 1. 머티리얼 디자인 위젯
        home: Scaffold(  // 2. Scaffold 위젯
          body: Center(
            child : Text(  // 3. Text 위젯
              'Hello Code Factory',  // 4. 마지막 매개변수 끝에 콤마 추가
            ),
          ),
        ),
      ),
  );
}*/


