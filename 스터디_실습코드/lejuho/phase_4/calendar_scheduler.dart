import './screen/calendar_scheduler_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import './database/drift_database.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import './provider/schedule_provider.dart';
import './repository/schedule_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  final database = LocalDatabase();

  final repository = ScheduleRepository();
  final scheduleProvider = ScheduleProvider(repository: repository);

  GetIt.I.registerSingleton<LocalDatabase>(database);

  runApp(
    ChangeNotifierProvider(
      create: (_) => scheduleProvider,
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}