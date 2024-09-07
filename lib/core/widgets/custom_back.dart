import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/constants/my_colors.dart';

class CustomBack extends StatelessWidget {
  const CustomBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: CircleAvatar(
          radius: 13.r,
          backgroundColor: const Color(0xffB5B5B5),
          child: CircleAvatar(
            radius: 12.r,
            backgroundColor: secondColor,
            child: Icon(
              Icons.arrow_back_rounded,
              color: /* const Color(0xffB5B5B5) */ mainColor,
              size: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
