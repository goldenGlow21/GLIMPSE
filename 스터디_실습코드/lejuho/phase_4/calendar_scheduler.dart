import './screen/calendar_scheduler_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import './database/drift_database.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import './provider/schedule_provider.dart';
import './repository/schedule_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:calendar_scheduler/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting();

  final database = LocalDatabase(); // ➊ 데이터베이스 생성

  final repository = ScheduleRepository();
  final scheduleProvider = ScheduleProvider(repository: repository);

  GetIt.I.registerSingleton<LocalDatabase>(database); // ➋ GetIt에

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}