
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/theming/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.textButton,
    required this.onTap,
  });
  final String text;
  final String textButton;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyles.font16Blac400W.copyWith(fontSize: 14.h),
        ),
        SizedBox(
          width: 4.w,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textButton,
            style: TextStyles.font16Blac400W
                .copyWith(fontSize: 14.h, color: mainColor),
          ),
        )
      ],
    );
  }
}
