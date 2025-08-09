import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/utils/widgets/custom_textfield.dart';
import 'package:shopora/generated/l10n.dart';

class EmailTextfield extends StatelessWidget {
  const EmailTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: CustomTextfield(
        label: S.of(context).email,
        hint: S.of(context).email,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
