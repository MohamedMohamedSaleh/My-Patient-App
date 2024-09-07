import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_image.dart';

class CustomGoogleRegister extends StatelessWidget {
  const CustomGoogleRegister({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80.w),
      child: SizedBox(
        height: 44.h,
        child: InkWell(
          onTap: onTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: secondColor,
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                color: const Color(0xffA4A4A4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImage(
                  'assets/images/svg/logos_google.svg',
                  width: 16.w,
                  height: 16.5.h,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'Google',
                  style: TextStyles.font16Blac400W.copyWith(
                    fontSize: 12.sp,
                    color: const Color(0xffA4A4A4),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
