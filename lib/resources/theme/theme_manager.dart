import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

mixin ThemeManager {
  static ThemeData getLightTheme() {
    final TextStyle titleLarge = const TextStyle(
      fontSize: 24.0,
      color: ColorsManager.blackText,
      fontWeight: FontWeight.w700,
    );
    final TextStyle displaySmall = const TextStyle(
      fontSize: 19.0,
      color: ColorsManager.blackText,
      fontWeight: FontWeight.w500,
    );
    final TextStyle titleMedium = const TextStyle(
      fontSize: 16.0,
      color: ColorsManager.blackText,
      fontWeight: FontWeight.w600,
    );
    final TextStyle titleSmall = const TextStyle(
      fontSize: 16.0,
      color: ColorsManager.blackText,
      fontWeight: FontWeight.w400,
    );
    final TextStyle bodyLarge = const TextStyle(
      fontSize: 14.0,
      color: ColorsManager.blackText,
      fontWeight: FontWeight.w400,
    );
    final TextStyle bodyMedium = const TextStyle(
      fontSize: 12.0,
      color: ColorsManager.blackText,
      fontWeight: FontWeight.w400,
    );

    final TextStyle bodySmall = const TextStyle(
      fontSize: 10.0,
      color: ColorsManager.blackText,
      fontWeight: FontWeight.w400,
    );
    return ThemeData(
      useMaterial3: true,
      fontFamily: FontsManager.fontFamily,
      fontFamilyFallback: FontsManager.fontFamilyFallback,
      dialogBackgroundColor: ColorsManager.background,
      scaffoldBackgroundColor: ColorsManager.background,
      primaryColor: ColorsManager.primary,
      brightness: Brightness.light,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorsManager.primary,
        selectionColor: ColorsManager.primary.withValues(alpha: 0.5),
        selectionHandleColor: ColorsManager.primary,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorsManager.primary,
        secondary: ColorsManager.secondary,
        surface: ColorsManager.background,
        onSurface: ColorsManager.blackText,
        brightness: Brightness.light,
        error: ColorsManager.error,
      ),
      canvasColor: ColorsManager.background,
      cardTheme: const CardTheme(
        color: ColorsManager.cardOnBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 4.0,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeManager.smallRadius,
            ),
          ),
          backgroundColor: ColorsManager.primary,
          textStyle: titleMedium.copyWith(
            color: ColorsManager.whiteText,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeManager.smallRadius,
            ),
          ),
          backgroundColor: ColorsManager.whiteText,
          textStyle: titleMedium,
        ),
      ),
      hintColor: ColorsManager.onFilledText,
      searchBarTheme: SearchBarThemeData(
        backgroundColor: const WidgetStatePropertyAll(
          ColorsManager.filled,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: const BorderSide(
              color: ColorsManager.greyBorder,
              width: SizeManager.smallRadius,
            ),
            borderRadius: BorderRadius.circular(
              SizeManager.smallRadius,
            ),
          ),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          fillColor: ColorsManager.filled,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsManager.greyBorder,
              width: SizeManager.thinBorder,
            ),
            borderRadius: BorderRadius.circular(
              SizeManager.smallRadius,
            ),
          ),
        ),
      ),
      cardColor: ColorsManager.cardOnBackground,
      dividerColor: ColorsManager.divider,
      appBarTheme: const AppBarTheme(
        color: ColorsManager.background,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: ColorsManager.background,
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
          fontFamily: FontsManager.fontFamily,
          fontFamilyFallback: FontsManager.fontFamilyFallback,
        ),
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.isNotEmpty && states.first == WidgetState.selected) {
            return ColorsManager.primary;
          }
          return ColorsManager.grey;
        }),
      ),
      checkboxTheme: const CheckboxThemeData(
        side: BorderSide(
          color: ColorsManager.grey,
        ),
      ),
      textTheme: TextTheme(
        displaySmall: displaySmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          textStyle: bodyMedium,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: const BorderSide(
            color: ColorsManager.grey,
          ),
          textStyle: bodyMedium,
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: ColorsManager.background,
        titleTextStyle: titleSmall,
        contentTextStyle: bodyMedium,
        surfaceTintColor: Colors.transparent,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: Colors.transparent,
        backgroundColor: ColorsManager.background,
      ),
      datePickerTheme: DatePickerThemeData(
        headerBackgroundColor: ColorsManager.primary,
        headerForegroundColor: ColorsManager.blackText,
        backgroundColor: ColorsManager.background,
        yearForegroundColor: WidgetStateProperty.all<Color>(
          ColorsManager.blackText,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: ColorsManager.background,
        elevation: 0.0,
        surfaceTintColor: Colors.transparent,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          foregroundColor: ColorsManager.primary,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: ColorsManager.divider,
        thickness: SizeManager.mediumBorder,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: CircleBorder(),
        backgroundColor: ColorsManager.primary,
        elevation: 2.0,
        foregroundColor: ColorsManager.background,
      ),
      listTileTheme: ListTileThemeData(
        tileColor: Colors.transparent,
        titleTextStyle: bodyLarge,
        subtitleTextStyle: bodyMedium.copyWith(
          color: ColorsManager.greyText,
        ),
      ),
    ).copyWith(
      extensions: <ThemeExtension<CustomThemeData>>[
        CustomThemeData(
          secondaryBackground: ColorsManager.secondaryBackground,
          grey: ColorsManager.grey,
          black: ColorsManager.black,
          white: ColorsManager.white,
          success: ColorsManager.success,
          error: ColorsManager.error,
          warning: ColorsManager.warning,
          blackText: ColorsManager.blackText,
          whiteText: ColorsManager.whiteText,
          greyText: ColorsManager.greyText,
          linkText: ColorsManager.linkText,
          onFilledText: ColorsManager.onFilledText,
          greyIcon: ColorsManager.greyIcon,
          primaryIcon: ColorsManager.primaryIcon,
          blackIcon: ColorsManager.blackIcon,
          whiteIcon: ColorsManager.whiteIcon,
          onFilledIcon: ColorsManager.onFilledIcon,
          greyBorder: ColorsManager.greyBorder,
          focusBorder: ColorsManager.focusBorder,
          filled: ColorsManager.filled,
          onFilled: ColorsManager.onFilled,
          cardOnBackground: ColorsManager.cardOnBackground,
          cardOnSecondaryBackground: ColorsManager.cardOnSecondaryBackground,
          divider: ColorsManager.divider,
          lightGrey: ColorsManager.lightGrey,
        ),
      ],
    );
  }
}
