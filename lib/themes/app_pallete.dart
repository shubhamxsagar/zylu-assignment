import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppPallete {
  static Color backgroundColor = Colors.amber;
  static Color? gradient1 = Colors.amber;
  static Color? gradient2 = Colors.amber;
  static const Color gradient3 = Color.fromRGBO(1, 29, 69, 1);
  static const Color gradient4 = Color.fromRGBO(0, 21, 51, 1);

  static const Color borderColor = Color.fromRGBO(52, 51, 67, 1);
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;
  static const Color errorColor = Colors.redAccent;
  static const Color transparentColor = Colors.transparent;
}

class AppTheme {
  static OutlineInputBorder _border([Color color = AppPallete.borderColor]) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppPallete.whiteColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppPallete.whiteColor,
      shape: StadiumBorder(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2!),
      errorBorder: _border(AppPallete.errorColor),
    ),
  );
}

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(AppTheme.lightThemeMode);

  static final ThemeData _darkTheme = AppTheme.lightThemeMode.copyWith(
    scaffoldBackgroundColor: AppPallete.gradient4,
    appBarTheme: AppTheme.lightThemeMode.appBarTheme!.copyWith(
      backgroundColor: AppPallete.gradient4,
    ),
    inputDecorationTheme:
        AppTheme.lightThemeMode.inputDecorationTheme!.copyWith(
      focusedBorder: AppTheme._border(AppPallete.gradient2!),
    ),
  );

  void toggleTheme() {
    state =
        state == AppTheme.lightThemeMode ? _darkTheme : AppTheme.lightThemeMode;
  }
}

// Create StateNotifierProvider for ThemeNotifier
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});
