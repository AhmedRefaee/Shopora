import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/core/config/themes/theme_extensions/theme_extenstions.dart';
import 'package:pinput/pinput.dart';

class EmailVerificationTextField extends StatefulWidget {
  final int codeLength;
  final ValueChanged<String>? onCodeComplete;
  final TextEditingController? verificationController;
  final bool hasError;

  const EmailVerificationTextField({
    super.key,
    this.codeLength = 6,
    this.onCodeComplete,
    this.verificationController,  
    this.hasError = false,
  });

  @override
  State<EmailVerificationTextField> createState() => _EmailVerificationTextFieldState();
}

class _EmailVerificationTextFieldState extends State<EmailVerificationTextField> {
  late final TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = widget.verificationController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.verificationController == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value) {
    if (value.length == widget.codeLength) {
      widget.onCodeComplete?.call(value);
    }
  }

  PinTheme _buildPinTheme(BuildContext context) {
    return PinTheme(
      width: 50.w,
      height: 55.h,
      textStyle: AppTextStyles.sixteen.copyWith(color: context.colors.onSurface),
      decoration: BoxDecoration(
        color: widget.hasError 
            ? context.colors.error.withOpacity(0.1) 
            : context.colors.surface,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: widget.hasError 
              ? context.colors.error 
              : context.colors.secondary.withOpacity(0.3),
          width: 1.w,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultTheme = _buildPinTheme(context);
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Form(
        key: _formKey,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            length: widget.codeLength,
            controller: _controller,
            defaultPinTheme: defaultTheme,
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            pinContentAlignment: Alignment.center,
            keyboardType: TextInputType.number,
            onCompleted: _onChanged,
            onChanged: _onChanged,
            focusedPinTheme: defaultTheme.copyWith(
              decoration: defaultTheme.decoration!.copyWith(
                border: Border.all(
                  color: widget.hasError ? context.colors.error : context.colors.primary,
                  width: 2.w,
                ),
              ),
            ),
            submittedPinTheme: defaultTheme.copyWith(
              decoration: defaultTheme.decoration!.copyWith(
                color: widget.hasError 
                    ? context.colors.error.withOpacity(0.1) 
                    : context.colors.primary.withOpacity(0.1),
                border: Border.all(color: context.colors.primary, width: 1.w),
              ),
            ),
            errorPinTheme: defaultTheme.copyWith(
              decoration: defaultTheme.decoration!.copyWith(
                border: Border.all(color: context.colors.error, width: 2.w),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
