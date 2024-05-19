import 'package:flutter/material.dart';

class AppPadding {
  static final AppPadding _singleton = AppPadding._internal();

  factory AppPadding() {
    return _singleton;
  }
  AppPadding._internal();

  static const double paddingValue20 = 20.0;
  static const double paddingValue15 = 15.0;
  static const double paddingValue10 = 10.0;

  final EdgeInsets pA20 = const EdgeInsets.all(paddingValue20);
  final EdgeInsets pA15 = const EdgeInsets.all(paddingValue15);
  final EdgeInsets pA10 = const EdgeInsets.all(paddingValue10);

  final EdgeInsets pH20 =
      const EdgeInsets.symmetric(horizontal: paddingValue20);
  final EdgeInsets pH15 =
      const EdgeInsets.symmetric(horizontal: paddingValue15);
  final EdgeInsets pH10 =
      const EdgeInsets.symmetric(horizontal: paddingValue10);

  final EdgeInsets pV20 = const EdgeInsets.symmetric(vertical: paddingValue20);
  final EdgeInsets pV15 = const EdgeInsets.symmetric(vertical: paddingValue15);
  final EdgeInsets pV10 = const EdgeInsets.symmetric(vertical: paddingValue10);
}
