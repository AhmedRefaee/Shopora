import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_colors.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';

enum ValidationState { none, valid, invalid }

class CustomTextfield extends StatefulWidget {
  final String label;
  final String? hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enableVisibilityToggle;
  final ValidationState validationState;
  final Widget? prefixIcon;

  const CustomTextfield({
    super.key,
    required this.label,
    this.hint,
    this.validator,
    this.controller,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enableVisibilityToggle = false,
    this.validationState = ValidationState.none,
    this.prefixIcon,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool _obscured;

  @override
  void initState() {
    super.initState();
    _obscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      style: AppTextStyles.fourteen,
      keyboardType: widget.keyboardType,
      obscureText: widget.enableVisibilityToggle
          ? _obscured
          : widget.obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _buildSuffixIcons(),
      ),
    );
  }

  Widget? _buildSuffixIcons() {
    final icons = <Widget>[];

    if (widget.enableVisibilityToggle) {
      icons.add(
        IconButton(
          icon: Icon(
            _obscured ? Icons.visibility : Icons.visibility_off,
            size: 20.sp,
          ),
          onPressed: () => setState(() => _obscured = !_obscured),
        ),
      );
    }

    if (widget.validationState != ValidationState.none) {
      icons.add(
        Icon(
          widget.validationState == ValidationState.valid
              ? Icons.check
              : Icons.close,
          size: 20.sp,
          color: widget.validationState == ValidationState.valid
              ? AppColors.shoporaSuccess
              : AppColors.shoporaError,
        ),
      );
    }

    if (icons.isEmpty) return null;
    if (icons.length == 1) return icons.first;

    return Row(mainAxisSize: MainAxisSize.min, children: icons);
  }
}
