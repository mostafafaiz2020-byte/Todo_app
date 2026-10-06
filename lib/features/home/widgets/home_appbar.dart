// features/home/widgets/home_appbar.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:lec18/core/add/app_const.dart';
import 'package:lec18/features/lodin_screen/data/user_model.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? user = Hive.box<UserModel>(
      AppConst.userbox,
    ).get(AppConst.currentuser);
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: Image.file(File(user?.image ?? "")).image,
        ),

        20.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good morning"),
            Text(
              user?.name ?? "",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ],
    );
  }
}
