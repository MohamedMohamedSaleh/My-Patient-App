import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/constants/my_colors.dart';
import 'package:my_patient/core/logic/helper_mothods.dart';
import 'package:my_patient/core/theming/styles.dart';
import 'package:my_patient/core/widgets/app_image.dart';
import 'package:my_patient/auth.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        navigateTo(toPage: const Auth(), dontRemove: false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlipInX(
              duration: const Duration(seconds: 3),
              child: ZoomIn(
                duration: const Duration(seconds: 3),
                child: AppImage(
                  'assets/images/svg/splash_image.svg',
                  height: 115.h,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Your Vital Signs, Your Peace of Mind.',
              style: TextStyles.font16Blac400W,
            ),
            SizedBox(
              height: 40.h,
            ),
            const _CustomLoading(),
          ],
        ),
      ),
    );
  }
}

class _CustomLoading extends StatefulWidget {
  const _CustomLoading();

  @override
  State<_CustomLoading> createState() => __CustomLoadingState();
}

class __CustomLoadingState extends State<_CustomLoading> {
  int isIndex = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (isIndex < 2) {
        isIndex++;
      } else {
        isIndex = 0;
      }
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            3,
            (index) => CircleAvatar(
              radius: 8,
              backgroundColor:
                  index == isIndex ? mainColor : mainColor.withOpacity(.1),
            ),
          ),
        ],
      ),
    );
  }
}
