import 'package:flutter/material.dart';

extension contextExtention on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }

  bool get isLightMode {
    return Theme.of(this).brightness == Brightness.light;
  }
}
