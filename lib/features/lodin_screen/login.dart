// features/lodin_screen/login.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:lec18/core/add/app_const.dart';
import 'package:lec18/core/main_boton.dart';
import 'package:lec18/features/home/home.dart';
import 'package:lec18/features/lodin_screen/data/user_model.dart';
import 'package:lec18/features/lodin_screen/widgets/LoginDesc.dart';
import 'package:lec18/features/lodin_screen/widgets/LoginPhoto.dart';
import 'package:lec18/features/lodin_screen/widgets/form.dart';

import 'package:lec18/gen/locale_keys.g.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  save_data(UserModel user) async {
    await Hive.box<UserModel>(AppConst.userbox)
        .put(AppConst.currentuser, user)
        .then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        })
        .catchError((error) {});
  }

  var nameController = TextEditingController();

  String? imagePath;

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

                LoginPhoto(
                  onImageSelected: (image) {
                    imagePath = image;
                  },
                ),

                20.verticalSpace,

                const Logindesc(),

                30.verticalSpace,

                Form_fild(nameController: nameController),

                70.verticalSpace,

                MainBotton(
                  title: LocaleKeys.login_text_button.tr(),
                  onTap: () {
                    save_data(
                      UserModel(
                        name: nameController.text,
                        image: imagePath ?? "",
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
