import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/my_colors.dart';

class CustomRegistrationButton extends StatelessWidget {
  const CustomRegistrationButton(
      {super.key,
      this.isSignIN = false,
      required this.title,
      required this.onTap});
  final bool isSignIN;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xffEBEBEB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
          side: BorderSide(
            color: secondColor,
            width: 4.w,
          ),
        ),
        padding: const EdgeInsets.only(left: 24, right: 12),
        fixedSize: Size(148.w, 52.h),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          CircleAvatar(
            backgroundColor: secondColor,
            radius: 16.r,
            child: Icon(
              Icons.arrow_outward_rounded,
              size: 20.sp,
              color: !isSignIN ? mainColor : const Color(0xffA4A4A4),
            ),
          ),
        ],
      ),
    );
  }
}

//  return InkWell(
//       onTap: onTap,
//       child: Container(
//         alignment: Alignment.center,
//         width: 148.w,
//         height: 52.h,
//         decoration: BoxDecoration(
//             color: const Color(0xffEBEBEB),
//             border: Border.all(
//               color: secondColor,
//               width: 4.w,
//             ),
//             borderRadius: BorderRadius.circular(20.r)),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 24, right: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 title,
//                 style: TextStyles.font16Blac400W,
//               ),
//               CircleAvatar(
//                 backgroundColor: secondColor,
//                 radius: 16.r,
//                 child: Icon(
//                   Icons.arrow_outward_rounded,
//                   size: 20.sp,
//                   color: !isSignIN ? mainColor : const Color(0xffA4A4A4),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
