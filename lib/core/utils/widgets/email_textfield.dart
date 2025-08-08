import 'package:flutter/material.dart';
import 'package:shopora/core/utils/widgets/custom_textfield.dart';
import 'package:shopora/generated/l10n.dart';


class EmailTextField extends CustomTextfield {
  
  EmailTextField({
    super.key,
    super.validator,
    super.controller,
    super.onChanged,
    super.validationState,
  }) : super(
    label: S.current.email,
    keyboardType: TextInputType.emailAddress,
    obscureText: false,
  );
}
