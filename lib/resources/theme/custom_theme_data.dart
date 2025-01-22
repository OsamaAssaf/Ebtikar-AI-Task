import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class CustomThemeData extends ThemeExtension<CustomThemeData> {
  CustomThemeData({
    required this.secondaryBackground,
    required this.grey,
    required this.black,
    required this.white,
    required this.success,
    required this.error,
    required this.warning,
    required this.blackText,
    required this.whiteText,
    required this.greyText,
    required this.linkText,
    required this.onFilledText,
    required this.greyIcon,
    required this.primaryIcon,
    required this.blackIcon,
    required this.whiteIcon,
    required this.onFilledIcon,
    required this.greyBorder,
    required this.focusBorder,
    required this.filled,
    required this.onFilled,
    required this.cardOnBackground,
    required this.cardOnSecondaryBackground,
    required this.divider,
    required this.lightGrey,
  });

  final Color secondaryBackground;
  final Color grey;
  final Color black;
  final Color white;
  final Color success;
  final Color error;
  final Color warning;
  final Color blackText;
  final Color whiteText;
  final Color greyText;
  final Color linkText;
  final Color onFilledText;
  final Color greyIcon;
  final Color primaryIcon;
  final Color blackIcon;
  final Color whiteIcon;
  final Color onFilledIcon;
  final Color greyBorder;
  final Color focusBorder;
  final Color filled;
  final Color onFilled;
  final Color cardOnBackground;
  final Color cardOnSecondaryBackground;
  final Color divider;
  final Color lightGrey;

  @override
  ThemeExtension<CustomThemeData> copyWith() {
    return CustomThemeData(
      secondaryBackground: secondaryBackground,
      grey: grey,
      black: black,
      white: white,
      success: success,
      error: error,
      warning: warning,
      blackText: blackText,
      whiteText: whiteText,
      greyText: greyText,
      linkText: linkText,
      onFilledText: onFilledText,
      greyIcon: greyIcon,
      primaryIcon: primaryIcon,
      blackIcon: blackIcon,
      whiteIcon: whiteIcon,
      onFilledIcon: onFilledIcon,
      greyBorder: greyBorder,
      focusBorder: focusBorder,
      filled: filled,
      onFilled: onFilled,
      cardOnBackground: cardOnBackground,
      cardOnSecondaryBackground: cardOnSecondaryBackground,
      divider: divider,
      lightGrey: lightGrey,
    );
  }

  @override
  ThemeExtension<CustomThemeData> lerp(covariant ThemeExtension<CustomThemeData>? other, double t) {
    if (other is! CustomThemeData) {
      return this;
    }
    return CustomThemeData(
      secondaryBackground: secondaryBackground,
      grey: grey,
      black: black,
      white: white,
      success: success,
      error: error,
      warning: warning,
      blackText: blackText,
      whiteText: whiteText,
      greyText: greyText,
      linkText: linkText,
      onFilledText: onFilledText,
      greyIcon: greyIcon,
      primaryIcon: primaryIcon,
      blackIcon: blackIcon,
      whiteIcon: whiteIcon,
      onFilledIcon: onFilledIcon,
      greyBorder: greyBorder,
      focusBorder: focusBorder,
      filled: filled,
      onFilled: onFilled,
      cardOnBackground: cardOnBackground,
      cardOnSecondaryBackground: cardOnSecondaryBackground,
      divider: divider,
      lightGrey: lightGrey,
    );
  }
}
