// core/features/lodin_screen/widgets/form.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lec18/gen/locale_keys.g.dart';

class Form_fild extends StatefulWidget {
  const Form_fild({super.key});

  @override
  State<Form_fild> createState() => _FormFildState();
}

class _FormFildState extends State<Form_fild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.login_full_name.tr(),
          style: TextStyle(fontSize: 18.sp),
        ),

        5.verticalSpace,

        TextFormField(
          onTapOutside: (value) {
            FocusScope.of(context).unfocus();
          },

          cursorColor: Colors.blue,

          decoration: InputDecoration(
            hintText: "********",
            hintStyle: TextStyle(fontSize: 20.sp),

            fillColor: const Color.fromARGB(255, 245, 240, 240),
            filled: true,

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20.r),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
      ],
    );
  }
}
