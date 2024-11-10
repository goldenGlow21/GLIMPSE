import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // 플러터 프레임워크가 준비될 때 까지 대기

  await initializeDateFormatting(); // intl 패키지 초기화 (다국어화)

  final database = LocalDatabase(); // DB 생성

  GetIt.I.registerSingleton<LocalDatabase>(database); // GetIt에 DB 변수 주입

  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}
