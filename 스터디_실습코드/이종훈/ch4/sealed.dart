// sealed class Parent{}

import '4_a.dart';

Parent parent = Parent();    //불가능

class Child1 extends Parent {}    //불가능

class Child2 implements Parent {}    //불가능