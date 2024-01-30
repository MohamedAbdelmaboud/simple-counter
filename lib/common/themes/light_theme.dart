import 'package:flutter/material.dart';

import '../extensions/light_theme_extension.dart';

ThemeData lightTheme() => ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      extensions: [
        lightThemeExtension,
      ],
    );
