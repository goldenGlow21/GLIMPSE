void main(){
 runApp(
  MaterialApp(
   home:Scaffold(
    body: Center(
     child:Text(
     'Hello Code Factory',
      ),
     ),
    ),
   ),
  );
}

Center(
    child: Text('Code Factory'),
    ),
// Code Factory
    
//--------------------------

SizedBox(width: double.infinity,
 child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
   Text('Code'),
   Text('Factory'),
   ],
  ),
 ),
// Code
// Factory

Text(
'코드팩토리',
style: TextStyle(
 fontSize: 16.0,
 fontWeight: FontWeight.w700,
 color: Colors.blue,
),
)

TextButton( // 텍스트만 있는 버튼

onPressed: () {}, // 눌렸을 때 실행할 함수

style: TextButton.styleFrom(
 foregroundColor: Colors.red,
 ),
child: Text('텍스트 버튼'), // 버튼에 작성할 글자
),
//----------------------------------
OutlinedButton( // 테두리가 있는 버튼

onPressed: (){},

style: OutlinedButton.styleFrom(
 foregroundColor: Colors.red,
 ),

child: Text('아웃라인드 버튼'),
)
//-----------------------------------
ElevatedButton( // 입체적으로 튀어나와보이는 버튼

onPressed: (){},

style: ElevatedButton.styleFrom(
 foregroundColor: Colors.red,
 ),

child: Text('엘리베이티드 버튼'),
)
//--------------------------------
IconButton( // 아이콘을 버튼으로 생성

 onPressed: (){},
 
 icon: Icon(
  Icons.home, // 플러터에서 기본제공하는 아이콘 중 집 모양 아이콘
  ),
  
 )
//----------------------------------
FloatingActionButton( // 화면 내 어떤 위치에 지속적으로 떠 있거나 이벤트로 나타나는 버튼

 onPressed:(){},
 child: Text('클릭'),
 
 ),
//--------------------------------
GestureDetector( // 제스처 감지

 onTap: (){ // 탭 했을때
  print("on Tap");
 },
 
 onDoubleTap:(){ // 두 번 탭 했을때
  print("on double tap");
 },
 
 onLongPress:(){ // 길게 눌렀을 때
  print("on long press");
 },
 
 child: Container( // 제스처를 적용할 위젯
  decoration: BoxDecoration(
   color: Colors.red,
   ),
  width: 100.0,
  height: 100.0,
  
 ),
)

Container(
 decoration: BoxDecoration(
  color: Colors.red,
  border: Border.all( // 테두리를 만들 위치와 색,두께를 설정
   width: 16.0,
   color: Colors.black,
  ),
  borderRadius:BorderRadius.circular( // 테두리를 둥글게할 정도를 설정
   16.0,
  ),
 ),
 height: 200.0,
 width: 100.0,
)
//--------------------------------
SizedBox(

 height: 200.0,
 width: 200.0,
 
 child:Container(
  color: Colors.red, // 크기는 위에 지정한 SizedBox의 크기인 빨간색 사각형 생성
 ),
 
)
//-----------------------------
Container( // 제일 바깥 검은색 사각형
 color: Colors.black,
 child: Container( // 검은색 사각형 안의 파란 사각형 (margin으로 떨어져 있음)
  color: Colors.blue,
  
  margin: EdgeInsets.all(16.0), // margin은 위젯이 아닌 속성
  
  child: Padding( // Padding은 하나의 위젯
   padding: EdgeInsets.all(16.0),
   child: Container( // 파란 사각형 안의 빨간 사각형 (Padding으로 떨어져 있음)
    color: Colors.red,
    width: 50,
    height: 50,
   ),
  ),
 ),
)

SafeArea(
 top: true,
 bottom: true,
 left: true,
 right: true,
 child: Container(
  color: Colors.red,
  height: 300.0,
  widht: 300.0,
 ),
),


class ColumnWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: double.infinity, // 열의 너비를 최대한으로 설정
          child: Column(
            // 주축 정렬 지정, 주축은 세로
            mainAxisAlignment: MainAxisAlignment.start,
            // 반대축 정렬 지정, 반대축은 가로
            crossAxisAlignment: CrossAxisAlignment.start,
            // 넣고 싶은 위젯 입력
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
              const SizedBox(width: 12.0),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.green,
              ),
              const SizedBox(width: 12.0),
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
}
//-----------------------------------------
class RowWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: double.infinity, // 행의 높이를 최대한으로 설정
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // 주축: 가로
            crossAxisAlignment: CrossAxisAlignment.center, // 반대축: 세로
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
              const SizedBox(width: 12.0),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.green,
              ),
              const SizedBox(width: 12.0),
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
}

Column(
 children: [
   Flexible(
     // flex는 남은 공간을 차지할 비율을 의미합니다.
     // flex값을 값을 제공하지 않으면 기본값은 1입니다.
     flex: 1,

     // 파란색 Container
     child: Container(
       color: Colors.blue,
     ),
   ),
   Flexible(
     flex: 1,

     // 빨간색 Container
     child: Container(
       color: Colors.red,
     ),
   )
 ],
),
//-------------------------------
Column(
 children: [
   Expanded(
     child: Container(
       color: Colors.blue,
     ),
   ),
   Expanded(
     child: Container(
       color: Colors.red,
     ),
   )
 ],
),


Stack(
 children: [
  Container(
   height: 300.0,
   width: 300.0,
   color: Colors.red,
  ),
  
  Container(
   height: 250.0,
   width: 250.0,
   color:Colors.yellow,
  ),
  
  Container(
   height: 200.0,
   width: 200.0,
   color: Colors.blue,
  ),
 ],
),


class MyApp extends StatelessWidget{
 @override
 Widget build(BuildContext context) {
  return MaterialApp(
   // 앱의 내용...
   );
  }
 }

/*class MyApp extends StatefulWidget{ // Stateful인 경우
 @override
 Widget build(BuildContext context) { // BuildContext형은 플러터의 트리 구조에서 활용되는 해당 위젯의 보고자 격인 객체
  return MaterialApp(
   // 앱의 내용...
   );
  }
 }*/

Container(
 decoration: BoxDecoration(
  color: Color(0xFFF99231),
 ),
 child: Column(
  children: [
   Image.asset(
   'assets/logo.png',
   ),
  CircularProgressIndicator(
   valueColor: AlwaysStoppedAnimation(
    Colors.white,
    ),
   ),
  ],
 ),
),