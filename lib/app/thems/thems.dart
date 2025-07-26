import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';

class AppTheme {
  AppTheme._();

  static FontWeight _getFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
    }
    return FontWeight.w400;
  }

  static TextStyle getTextStyle(TextStyle textStyle,{int fontWeight = 500, bool muted = false, bool xMuted = false, double letterSpacing = 0.15, Color? color, TextDecoration decoration = TextDecoration.none, double? height, double wordSpacing = 0, double? fontSize}) {
    double? finalFontSize = fontSize ?? textStyle.fontSize;

    Color? finalColor;
    if (color == null) {
      finalColor = xMuted
          ? textStyle.color!.withAlpha(160)
          : (muted ? textStyle.color!.withAlpha(200) : textStyle.color);
    }
    else {
      finalColor = xMuted
          ? color.withAlpha(160)
          : (muted ? color.withAlpha(200) : color);
    }

    return GoogleFonts.poppins(
        fontSize: finalFontSize,
        fontWeight: _getFontWeight(fontWeight),
        letterSpacing: letterSpacing,
        color: finalColor,
        decoration: decoration,
        height: height,
        wordSpacing: wordSpacing);
  }

  static final TextTheme appBarTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xff495057))),
    displayMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xff495057))),
    displaySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xff495057))),
    headlineMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xff495057))),
    headlineSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xff495057))),
    titleLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 18, color: Color(0xff495057))),
    titleMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xff495057))),
    titleSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff495057))),
    bodyLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xff495057))),
    bodyMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xff495057))),
    labelLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff495057))),
    bodySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xff495057))),
    labelSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 11, color: Color(0xff495057))),
  );

  static final TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xff4A4A4A))),
    displayMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xff4A4A4A))),
    displaySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xff4A4A4A))),
    headlineMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xff4A4A4A))),
    headlineSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xff4A4A4A))),
    titleLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 18, color: Color(0xff4A4A4A))),
    titleMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xff4A4A4A))),
    titleSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff4A4A4A))),
    bodyLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xff4A4A4A))),
    bodyMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xff4A4A4A))),
    labelLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff4A4A4A))),
    bodySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xff4A4A4A))),
    labelSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 11, color: Color(0xff4A4A4A))),
  );
  static final ThemeData themeData = ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      primaryColor: const Color(0xFF1C6BB0),
      // canvasColor: Colors.transparent,
      // scaffoldBackgroundColor: const Color(0xffffffff),
      canvasColor: const Color(0xffffffff), // Match the scaffold or card color
      scaffoldBackgroundColor: const Color(0xffffffff),
      appBarTheme: AppBarTheme(
        actionsIconTheme: const IconThemeData(
          color: Color(0xff495057),
        ),
        color: const Color(0xffffffff),
        iconTheme: const IconThemeData(color: Color(0xff495057), size: 24),
        toolbarTextStyle: appBarTextTheme.bodyMedium,
        titleTextStyle: appBarTextTheme.titleLarge,
      ),
      navigationRailTheme: const NavigationRailThemeData(
          selectedIconTheme:
          IconThemeData(color: Color(0xFF1C6BB0), opacity: 1, size: 24),
          unselectedIconTheme:
          IconThemeData(color: Color(0xFF1C6BB0), opacity: 1, size: 24),
          backgroundColor: Color(0xffffffff),
          elevation: 3,
          selectedLabelTextStyle: TextStyle(color: Color(0xFF1C6BB0)),
          unselectedLabelTextStyle: TextStyle(color: Color(0xff495057))),
      cardTheme: CardThemeData(
        color: Colors.white,
        shadowColor: Colors.black.withOpacity(0.4),
        elevation: 1,
        margin: const EdgeInsets.all(0),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 15, color: Color(0xaa495057)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Color(0xFF1C6BB0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black54),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.black54)),
      ),
      splashColor: Colors.white.withAlpha(100),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      textTheme: textTheme,
      disabledColor: const Color(0xffdcc7ff),
      highlightColor: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xFF1C6BB0),
          splashColor: Colors.white.withAlpha(100),
          highlightElevation: 8,
          elevation: 4,
          focusColor: const Color(0xFF1C6BB0),
          hoverColor: const Color(0xFF1C6BB0),
          foregroundColor: Colors.white),
      dividerColor: const Color(0xffd1d1d1),
      cardColor: Colors.white,
      popupMenuTheme: PopupMenuThemeData(
        color: const Color(0xffffffff),
        textStyle: textTheme.bodyMedium!.merge(const TextStyle(color: Color(0xff495057))),
      ),
      bottomAppBarTheme:
      const BottomAppBarTheme(color: Color(0xffffffff), elevation: 2),
      tabBarTheme: const TabBarThemeData(
        unselectedLabelColor: Color(0xff495057),
        labelColor: Color(0xFF1C6BB0),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xFF1C6BB0), width: 2.0),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: const Color(0xFF1C6BB0),
        inactiveTrackColor: const Color(0xFF1C6BB0).withAlpha(140),
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: const Color(0xFF1C6AAF),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
        tickMarkShape: const RoundSliderTickMarkShape(),
        inactiveTickMarkColor: Colors.red[100],
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(90, 45)),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey.withAlpha(100);
            }
            return const Color(0xFF1C6BB0);
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.black.withAlpha(100);
            }
            return Colors.white;
          }),
          padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(const Color(0xFF1C6BB0)),
            backgroundColor: WidgetStateProperty.all(Colors.white),
          )),
      colorScheme: const ColorScheme.light(
          primary: Color(0xFF1C6AAF),
          onPrimary: Colors.black,
          secondary: Color(0xffFADD03),
          onSecondary: Color(0xFF1C6AAF),
          surface: Color(0xffe2e7f1),
          onSurface: Color(0xff495057))
          .copyWith(surface: Colors.white)
          .copyWith(error: const Color(0xfff0323c))
          .copyWith(secondary: const Color(0xffFADD03)));
  static ThemeData getTheme() {
    return themeData;
  }


  //Dark Theme
  static final TextTheme darkAppBarTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xffE0E0E0))),
    displayMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xffE0E0E0))),
    displaySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xffE0E0E0))),
    headlineMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xffE0E0E0))),
    headlineSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xffE0E0E0))),
    titleLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 18, color: Color(0xffE0E0E0))),
    titleMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xffE0E0E0))),
    titleSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xffE0E0E0))),
    bodyLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xffE0E0E0))),
    bodyMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xffE0E0E0))),
    labelLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xffE0E0E0))),
    bodySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xffE0E0E0))),
    labelSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 11, color: Color(0xffE0E0E0))),
  );

  static final TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xffFAFAFA))),
    displayMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xffFAFAFA))),
    displaySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xffFAFAFA))),
    headlineMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xffFAFAFA))),
    headlineSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xffFAFAFA))),
    titleLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 18, color: Color(0xffFAFAFA))),
    titleMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xffFAFAFA))),
    titleSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xffFAFAFA))),
    bodyLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xffFAFAFA))),
    bodyMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xffFAFAFA))),
    labelLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xffFAFAFA))),
    bodySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xffFAFAFA))),
    labelSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 11, color: Color(0xffFAFAFA))),
  );

  static final ThemeData darkThemeData = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1C6BB0),
    // canvasColor: Colors.transparent,
    // scaffoldBackgroundColor: const Color(0xFF1C1C1C), // Dark background
    canvasColor: const Color(0xFF1C1C1C), // Match the scaffold background
    scaffoldBackgroundColor: const Color(0xFF1C1C1C),
    appBarTheme: AppBarTheme(
      actionsIconTheme: const IconThemeData(
        color: Color(0xffe0e0e0),
      ),
      color: const Color(0xFF1C1C1C),
      elevation: 0,
      iconTheme: const IconThemeData(color: Color(0xffe0e0e0), size: 24),
      toolbarTextStyle: darkAppBarTextTheme.bodyMedium?.copyWith(color: Colors.white),
      titleTextStyle: darkAppBarTextTheme.titleLarge?.copyWith(color: Colors.white),
    ),
    navigationRailTheme: const NavigationRailThemeData(
      selectedIconTheme: IconThemeData(color: Color(0xFF1C6BB0), opacity: 1, size: 24),
      unselectedIconTheme: IconThemeData(color: Color(0xFFB0BEC5), opacity: 1, size: 24),
      backgroundColor: Color(0xFF1C1C1C),
      elevation: 3,
      selectedLabelTextStyle: TextStyle(color: Color(0xFF1C6BB0)),
      unselectedLabelTextStyle: TextStyle(color: Color(0xffe0e0e0)),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1E1E1E),
      shadowColor: Colors.black.withOpacity(0.4),
      elevation: 1,
      margin: const EdgeInsets.all(0),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // hintStyle: TextStyle(fontSize: MySize.size14, color: const Color(0xaae0e0e0)),

      hintStyle: TextWidgetText.textWidgetStyle(
        themeData: themeData.textTheme.headlineMedium!,
        fontWeight: 400,
        fontSize:MySize.size14,
        color:AppColors.white
      ),
      focusedBorder:const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: AppColors.darkGrey),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(MySize.size4??0)),
        borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
      ),
      enabledBorder:const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: AppColors.darkGrey),
      ),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: AppColors.darkGrey)),
      fillColor:const Color(0xFF1C1C1C),
      filled: true,
      contentPadding: EdgeInsets.symmetric(
          vertical:MySize.size14??0,
          horizontal: MySize.size14??0),
    ),
    splashColor: Colors.black.withAlpha(50),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: darkTextTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
      decoration: TextDecoration.none,
      // decorationThickness: 0,
    ),
    disabledColor: const Color(0xff616161),
    highlightColor: Colors.black,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xFF1C6BB0),
      splashColor: Colors.black.withAlpha(50),
      highlightElevation: 8,
      elevation: 4,
      focusColor: const Color(0xFF1C6BB0),
      hoverColor: const Color(0xFF1C6BB0),
      foregroundColor: Colors.white,
    ),
    dividerColor: const Color(0xff373737),
    cardColor: const Color(0xFF1E1E1E),
    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xFF2C2C2C),
      textStyle: textTheme.bodyMedium?.copyWith(color: const Color(0xffe0e0e0)),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xFF1C1C1C),
      elevation: 2,
    ),
    tabBarTheme: const TabBarThemeData(
      unselectedLabelColor: Color(0xffe0e0e0),
      labelColor: Color(0xFF1C6BB0),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xFF1C6BB0), width: 2.0),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: const Color(0xFF1C6BB0),
      inactiveTrackColor: const Color(0xFF1C6BB0).withAlpha(140),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: const Color(0xFF1C6AAF),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.grey[700],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(90, 45)),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey.withAlpha(100);
          }
          return const Color(0xFF1C6BB0);
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.black.withAlpha(100);
          }
          return Colors.white;
        }),
        padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(const Color(0xFF1C6BB0)),
        backgroundColor: WidgetStateProperty.all(Colors.black),
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1C6AAF),
      onPrimary: Colors.white,
      secondary: Color(0xffFADD03),
      onSecondary: Color(0xFF1C6AAF),
      surface: Color(0xFF121212),
      onSurface: Colors.white,
      error: Color(0xfff0323c),
    ),
  );

  static ThemeData getDarkTheme() {
    return darkThemeData;
  }

}