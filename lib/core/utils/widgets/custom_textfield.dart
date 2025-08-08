import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_colors.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';

enum ValidationState {
  none,
  valid,
  invalid,
}

abstract class CustomTextfield extends StatefulWidget {
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValidationState validationState;

  const CustomTextfield({
    super.key,
    required this.label,
    this.validator,
    this.controller,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validationState = ValidationState.none,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      style: AppTextStyles.fourteen,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: _buildSuffixIcon(),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.validationState != ValidationState.none) {
      return Icon(
        widget.validationState == ValidationState.valid 
            ? Icons.check 
            : Icons.close,
        size: 20.sp,
        color: widget.validationState == ValidationState.valid 
            ? AppColors.shoporaSuccess 
            : AppColors.shoporaError,
      );
    }
    return null;
  }
}