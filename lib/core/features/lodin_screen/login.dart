// core/features/lodin_screen/login.dart

// core/features/lodin_screen/login.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lec18/core/features/home/home.dart';
import 'package:lec18/core/features/lodin_screen/widgets/LoginDesc.dart';
import 'package:lec18/core/features/lodin_screen/widgets/form.dart';
import 'package:lec18/core/features/lodin_screen/widgets/login_photo.dart';
import 'package:lec18/gen/locale_keys.g.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                25.verticalSpace,

                IconButton(
                  onPressed: () {
                    if (context.locale.languageCode == 'en') {
                      context.setLocale(const Locale('ar'));
                    } else {
                      context.setLocale(const Locale('en'));
                    }
                  },
                  icon: const Icon(Icons.language),
                ),

                25.verticalSpace,

                const LoginPhoto(),

                20.verticalSpace,

                const Logindesc(),

                30.verticalSpace,

                const Form_fild(),

                70.verticalSpace,

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          LocaleKeys.login_text_button.tr(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
