
import 'package:flutter/material.dart';
import 'package:shopora/features/auth/email_verification/presentation/view/widgets/email_verification_text_field.dart';

class EmailVerificationForm extends StatelessWidget {
  final List<TextEditingController> controllers;
  final bool hasError;

  const EmailVerificationForm({
    super.key,
    required this.controllers,
    required this.hasError,
  });

  @override
  Widget build(BuildContext context) {
    return EmailVerificationTextField(
      verificationController: controllers.first,
      codeLength: 6,
      hasError: hasError,
    );
  }
}
