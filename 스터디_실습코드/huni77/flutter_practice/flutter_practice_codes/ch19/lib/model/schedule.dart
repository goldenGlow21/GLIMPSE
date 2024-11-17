import 'package:drift/drift.dart';

class Schedules extends Table {
  IntColumn get id => integer().autoIncrement()(); // PK, 정수 열
  TextColumn get content => text()();  // 내용, 글자 열
  DateTimeColumn get date => dateTime()(); // 일정 날짜, 날짜 열
  IntColumn get startTime => integer()(); // 시작 시간
  IntColumn get endTime => integer()(); // 종료 시간
}