// features/splash/splash.dart

// features/splash/splash.dart

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lec18/core/add/app_const.dart';
import 'package:lec18/features/add_task/add.dart';
import 'package:lec18/features/home/home.dart';
import 'package:lec18/features/lodin_screen/data/user_model.dart';
import 'package:lec18/features/lodin_screen/login.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      next_page();
    });
  }

  ////////////////////////////////////
  next_page() {
    UserModel? user = Hive.box<UserModel>(
      AppConst.userbox,
    ).get(AppConst.currentuser);

    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }
  //////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/icons/todo.json')),
    );
  }
}
