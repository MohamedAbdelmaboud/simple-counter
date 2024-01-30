import 'package:flutter/material.dart';

class CustomThemeExtension implements ThemeExtension<CustomThemeExtension> {
  final Color counterValueColor;

  final Color counterBgColor;

  final Color squareContainerColor;

  const CustomThemeExtension(
      {required this.counterValueColor,
      required this.counterBgColor,
      required this.squareContainerColor});
  @override
  ThemeExtension<CustomThemeExtension> copyWith(
      {Color? counterValueColor,
      Color? counterBgColor,
      Color? squareContainerColor}) {
    return CustomThemeExtension(
      counterValueColor: counterValueColor ?? this.counterValueColor,
      counterBgColor: counterBgColor ?? this.counterBgColor,
      squareContainerColor: squareContainerColor ?? this.squareContainerColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    return this;
  }

  @override
  Type get type => CustomThemeExtension;
}
