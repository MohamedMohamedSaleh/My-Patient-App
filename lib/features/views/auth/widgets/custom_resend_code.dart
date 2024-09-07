import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patient/core/constants/my_colors.dart';

class CustomResendCode extends StatefulWidget {
  const CustomResendCode({
    super.key,
    required this.duration,
  });
  final int duration;

  @override
  State<CustomResendCode> createState() => _CustomResendCodeState();
}

class _CustomResendCodeState extends State<CustomResendCode> {
  double second = 0;
  double minute = 0;
  bool isTemerFinished = false;
  @override
  void initState() {
    super.initState();
    startCounting();
  }

  void startCounting() async {
    second = 0;
    minute = 0;
    isTemerFinished = false;
    for (int i = 0; i < widget.duration; i++) {
      if (!mounted) return;

      setState(() {});
      await Future.delayed(const Duration(seconds: 1));
      second++;
      if (second == 60) {
        minute++;
        second = 0;
      }
    }
    isTemerFinished = true;
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return !isTemerFinished
        ? Center(
            child: SizedBox(
              height: 52.h,
              width: 52.w,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: ((minute == 1) ? (second + 60) : second) /
                        widget.duration,
                    strokeWidth: 3,
                    backgroundColor: const Color(0xffD8D8D8),
                  ),
                  Center(
                    child: Text(
                      "${minute.round().toString().padLeft(2, '0')}:${second.round().toString().padLeft(2, '0')}",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: mainColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Center(
            child: _CustomOutlineButton(
              title: 'إعادة الإرسال',
              onPress: () {
                startCounting();
              },
            ),
          );
  }
}

class _CustomOutlineButton extends StatelessWidget {
  const _CustomOutlineButton({required this.onPress, required this.title});
  final VoidCallback onPress;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: mainColor),
        ),
        onPressed: onPress,
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
