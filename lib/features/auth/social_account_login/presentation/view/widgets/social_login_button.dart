import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 60.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          minimumSize: const Size(double.infinity, double.infinity),
          padding: EdgeInsets.zero,
          elevation: 3,
        ),
        onPressed: onPressed,
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: 20.w,
            height: 20.h,
          ),
        ),
      ),
    );
  }
}
