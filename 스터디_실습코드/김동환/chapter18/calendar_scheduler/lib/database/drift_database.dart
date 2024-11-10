import 'package:calendar_scheduler/model/schedule.dart';
import 'package:drift/drift.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

// private 값 까지 불러올 수 있음
part 'drift_database.g.dart'; // part 파일 지정

@DriftDatabase(
  tables: [
    Schedules,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());
  Stream<List<Schedule>> watchSchedules(DateTime date) =>
  // 1. 데이터를 조회하고 변화 감지
      (select(schedules)..where((tbl) => tbl.date.equals(date))).watch();
  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);
  // createSchedule() 아래에 작성
  Future<int> removeSchedule(int id) =>
      (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();
  // removeSchedule() 함수 아래에 작성
  @override
  int get schemaVersion => 1;
}

// LocalDatabase 클래스 아래에 작성
LazyDatabase _openConnection() {
  return LazyDatabase(() async {

    // 1. 데이터베이스 파일 저장할 폴더
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}