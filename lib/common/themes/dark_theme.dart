import 'package:flutter/material.dart';

import '../extensions/dark_theme_extension.dart';

ThemeData darkTheme() => ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
      extensions: [
        darkThemeExtension,
      ],
    );
