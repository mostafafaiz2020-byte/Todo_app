// main.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lec18/core/add/app_const.dart';
import 'package:lec18/features/lodin_screen/data/user_model.dart';

import 'todo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(AppConst.userbox);

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: Todo(),
    ),
  );
}
