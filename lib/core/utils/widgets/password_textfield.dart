
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_colors.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/core/utils/widgets/custom_textfield.dart';
import 'package:shopora/generated/l10n.dart';

class PasswordTextField extends CustomTextfield {
  PasswordTextField({
    super.key,
    super.validator,
    super.controller,
    super.onChanged,
    super.validationState,
  }) : super(
    label: S.current.password,
    keyboardType: TextInputType.visiblePassword,
    obscureText: true,
  );

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      style: AppTextStyles.fourteen,
      keyboardType: widget.keyboardType,
      obscureText: !_isPasswordVisible,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: _buildSuffixIcon(),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    List<Widget> icons = [];

    // Password visibility toggle
    icons.add(
      IconButton(
        icon: Icon(
          _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
          size: 20.sp,
          color: AppColors.shoporaSuccess,
        ),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      ),
    );

    // Validation icon
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

    // Return Row with multiple icons if needed
    if (icons.length == 1) return icons.first;
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: icons,
    );
  }
}
