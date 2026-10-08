// features/home/widgets/home_appbar.dart

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
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

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: const Color(0xff2563EB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor: Colors.white,
              backgroundImage: user?.image != null && user!.image!.isNotEmpty
                  ? FileImage(File(user.image!))
                  : null,
              child: user?.image == null || user!.image!.isEmpty
                  ? Icon(
                      Icons.person,
                      size: 32.sp,
                      color: const Color(0xff2563EB),
                    )
                  : null,
            ),

            15.horizontalSpace,

            // Greeting + Name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good morning",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),

                  3.verticalSpace,

                  Text(
                    user?.name ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  if (context.locale.languageCode == 'ar') {
                    context.setLocale(const Locale('en'));
                  } else {
                    context.setLocale(const Locale('ar'));
                  }
                },
                icon: Icon(Icons.language, color: Colors.white, size: 24.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
