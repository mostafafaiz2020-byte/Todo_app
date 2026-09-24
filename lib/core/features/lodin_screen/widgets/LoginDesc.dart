// core/features/lodin_screen/widgets/LoginDesc.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lec18/gen/locale_keys.g.dart';

class Logindesc extends StatefulWidget {
  const Logindesc({super.key});

  @override
  State<Logindesc> createState() => _LogindescState();
}

class _LogindescState extends State<Logindesc> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            LocaleKeys.login_title.tr(),
            style: TextStyle(fontSize: 27.sp, fontWeight: FontWeight.w600),
          ),
          1.verticalSpace,
          Text(
            LocaleKeys.login_subtitle.tr(),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
