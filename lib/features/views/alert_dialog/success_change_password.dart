import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/constants/my_colors.dart';
import 'package:my_patient/core/logic/helper_mothods.dart';
import 'package:my_patient/core/theming/styles.dart';
import 'package:my_patient/core/widgets/app_image.dart';

class SuccessChangePassword extends StatelessWidget {
  const SuccessChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (!didPop) {
          showMessage(
              message: 'You must come back to login',
              type: MessageType.success);
        }
      },
      canPop: false,
      child: ZoomIn(
        duration: const Duration(milliseconds: 800),
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          titlePadding: EdgeInsets.only(top: 40.h),
          actionsPadding: const EdgeInsets.all(0),
          title: AppImage(
            'assets/images/svg/success.svg',
            height: 78.h,
            width: 78.w,
          ),
          backgroundColor: secondColor,
          content: SizedBox(
            height: 115.h,
            child: Column(
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyles.font16Blac400W
                      .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Your password has been successfully changed.',
                  style: TextStyles.font16Blac400W.copyWith(
                    fontSize: 10.sp,
                    color: const Color(0xff636363),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const _CustomButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: FilledButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        style: FilledButton.styleFrom(
          elevation: 3.h,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        child: Text(
          'Back to Login',
          style: TextStyles.font16Blac400W.copyWith(
            fontSize: 12.sp,
            color: secondColor,
          ),
        ),
      ),
    );
  }
}
