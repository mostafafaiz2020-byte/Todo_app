// core/features/lodin_screen/widgets/login_photo.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPhoto extends StatelessWidget {
  const LoginPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 140.h,
        width: 160.w,

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(500.r)),

        child: ClipOval(
          child: Image.asset(
            "assets/images/image.png",
            width: 140.w,
            height: 140.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
