import 'dart:io';

import 'package:calendar_scheduler/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Schedules,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Stream<List<Schedule>> watchSchedules(DateTime date) =>
      (select(schedules)..where((tbl) => tbl.date.equals(date))).watch();

  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);

  Future<int> removeSchedule(int id) =>
      (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // DB 파일 저장할 폴더
    final dbFolder = await getApplicationDocumentsDirectory(); // path_provider 패키지에서 제공하는 getApplicationDocumentsDirectory() 함수를 사용하면 현재 앱에 배정되 폴더의 경로 받을 수 있음
    final file = File(p.join(dbFolder.path, 'db.sqlite')); // 해당 폴더에 db.sqlite 라는 파일을 DB 파일로 사용할 것이다.
    return NativeDatabase(file);
  });
}
