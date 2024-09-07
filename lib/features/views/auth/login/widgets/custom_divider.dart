import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            height: 0,
            color: Color(0xffEBEBEB),
            thickness: 1,
            // Customize the divider thickness
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            "or",
            style: TextStyles.font16Blac400W.copyWith(fontSize: 14.sp),
            textAlign: TextAlign.end,
          ),
        ),
        const Expanded(
          child: Divider(
            height: 0,
            color: Color(0xffEBEBEB),
            thickness: 1,
            // Customize the divider thickness
          ),
        ),
      ],
    );
  }
}
