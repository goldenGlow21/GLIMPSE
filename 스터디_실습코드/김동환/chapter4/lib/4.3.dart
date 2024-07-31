/*void main() {
  String dayKor = '월요일';
  // switch문이 함수처럼 값을 반환한다.
  String dayEnglish = switch (dayKor) {
  // '=>'를 사용하면 switch문 조건에 맞을 때 값을 반환할 수 있다.
  '월요일' => 'Monday',
  '화요일' => 'Tuesday',
  '수요일' => 'Wednesday',
  '목요일' => 'Thursday',
  '금요일' => 'Friday',
  '토요일' => 'Saturday',
  '일요일' => 'Sunday',
  // _는 default와 같은 의미로 사용된다.
  _ => 'Not Found',
  };
  // Monday 출력
  print(dayEnglish);
}*/

/*void switcher(dynamic anything) {
  switch (anything) {
    // 정확히 'aaa' 문자열만 매치한다.
    case 'aaa':
      print('match : aaa');
      break;
    // 정확히 [1, 2] 리스트만 매치한다.
    case [1, 2]:
      print('match : [1, 2]');
      break;
    // 3개의 값이 들어 있는 리스트를 모두 매치한다.
    case [_, _, _]:
      print('match [_,_,_]');
      break;
    // 첫 번째와 두 번째 값에 int가 입력된 리스트를 매치한다.
    case [int a, int b]:
      print('match : [int $a, int $b]');
      break;
    // 첫 번째 값에 String, 두 번째 값에 int가 입력된 Record 타입을 매치한다.
    case (String a, int b):
      print('match : (String: $a, int : $b');
      break;
    // 아무것도 매치되지 않을 경우 실행한다.
    default:
      print('no match');
  }
}

void main() {
  // match : aaa 출력
  switcher('aaa');
  // match : [1, 2] 출력
  switcher([1, 2]);
  // match : [_, _, _] 출력
  switcher([3, 4, 5]);
  // match : [int 6, int 7] 출력
  switcher([6, 7]);
  // match : (String : 민지, int : 19) 출력
  switcher(('민지', 19));
  // no match 출력
  switcher(8);
}*/

/*void main() {
  // val에 입력될 수 있는 값은 true, false, null 이다.
  bool? val;

  // null 조건을 입력하지 않았기  때문에 non exhaustive switch statement 에러 발생
  // null case를 추가하거나 default case를 추가해야 에러가 사라진다.
  switch(val) {
    case true:
      print('true');
    case false:
      print('false');
    case null:
      print('null');
  }
}*/

void main() {
  (int a, int b) val = (1, -1);
  // default가 출력된다. 만약에 b값을 0 이상으로 변경하면
  // 1, _를 출력할 수 있다.
  switch (val) {
    case (1, _) when val.$2 > 0:
      print('1, _');
      break;
    default:
      print('default');
  }
}