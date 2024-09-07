
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_image.dart';

class CustomData extends StatelessWidget {
  const CustomData({
    super.key,
    this.width,
    required this.imagePath,
    required this.title,
    required this.data,
  });
  final double? width;
  final String imagePath;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116.h,
      width: width ?? 148.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: secondColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0xffF1F3F4).withOpacity(.88),
            blurRadius: 40.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppImage(
                  imagePath,
                  height: 12.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xff696969),
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              data,
              style: TextStyles.font40Block600W
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
