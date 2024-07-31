import '4.4.1_a.dart';

// 인스턴스화 가능
Parent parent = Parent();

// 가능
base class Child extends Parent{}

// subtype of base or final is not base final or sealed 에러가 발생
// base / sealed / final 제한자 중 하나가 필요
class Child2 extends Parent{}

// subtype of base or final is not base final or sealed 에러가 발생
// base 클래스는 implement가 불가능
clss Child3 implements Parent{}