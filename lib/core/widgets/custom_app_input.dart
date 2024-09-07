import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppInput extends StatefulWidget {
  const CustomAppInput({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.passwordIcon,
    this.controller,
    this.validator,
  });

  final bool isPassword;
  final String labelText;
  final IconData? passwordIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<CustomAppInput> createState() => _CustomAppInputState();
}

class _CustomAppInputState extends State<CustomAppInput> {
  bool isHiden = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: isHiden && widget.isPassword,
        cursorHeight: 15.sp,
        style: TextStyle(
          fontSize: 15.sp,
        ),
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    isHiden
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 20.sp,
                    color: const Color(0xff696969),
                  ),
                  onPressed: () {
                    isHiden = !isHiden;
                    setState(() {});
                  },
                )
              : null,
          labelStyle: TextStyle(fontSize: 14.sp),
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff696969)),
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
      ),
    );
  }
}
