import 'dart:ui';

import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class Components {
  Components._();

  static final Components _instance = Components._();

  factory Components() => _instance;

  void snackBar({
    required String message,
    SnackBarStatus snackBarStatus = SnackBarStatus.warning,
    SnackBarPosition snackBarPosition = SnackBarPosition.top,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color? leftBarIndicatorColor;
    IconData? icon;
    switch (snackBarStatus) {
      case SnackBarStatus.success:
        leftBarIndicatorColor = ColorsManager.success;
        icon = Icons.check_circle_outline;
        break;
      case SnackBarStatus.error:
        leftBarIndicatorColor = ColorsManager.error;
        icon = Icons.error_outline_rounded;
        break;
      case SnackBarStatus.warning:
        leftBarIndicatorColor = ColorsManager.warning;
        icon = Icons.warning_amber_rounded;
        break;
      default:
        leftBarIndicatorColor = null;
        break;
    }
    final MediaQueryData mediaQuery = MediaQuery.of(scaffoldMessengerKey.currentContext!);
    final double statusBarHeight = mediaQuery.viewPadding.top;
    final double screenWidth = mediaQuery.size.width;
    double snackBarMargin = 16.0;
    if (screenWidth > ConstantsManager.maxSnackBarWidth) {
      final double diff = screenWidth - ConstantsManager.maxSnackBarWidth;
      snackBarMargin = diff / 2;
    }
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: leftBarIndicatorColor,
        behavior: SnackBarBehavior.floating,
        elevation: 4,
        margin: EdgeInsets.only(
          bottom: snackBarPosition == SnackBarPosition.top
              ? Get.height - (statusBarHeight + 54.0 + snackBarMargin)
              : snackBarMargin,
          right: snackBarMargin,
          left: snackBarMargin,
        ),

        dismissDirection: snackBarPosition == SnackBarPosition.top
            ? DismissDirection.horizontal
            : DismissDirection.down,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: Components().isDark() ? customTheme.black : customTheme.white,
            width: 1.0,
          ),
        ),
        // animation: CurvedAnimation(
        //   parent: AnimationController(
        //     vsync: scaffoldMessengerKey.currentState! as TickerProvider,
        //     duration: duration,
        //     // animationBehavior: AnimationBehavior.preserve,
        //   ),
        //   curve: Curves.bounceInOut,
        //   reverseCurve: Curves.linear,
        // ),
        // duration: duration,
        content: Row(
          children: [
            Expanded(
              child: ScaleText(
                message,
                maxLines: 2,
                style: theme.textTheme.titleLarge!.copyWith(
                  color: Components().isDark() ? customTheme.black : customTheme.white,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Icon(
              icon,
              color: Components().isDark() ? customTheme.black : customTheme.white,
              size: 26.0,
            ),
          ],
        ),
      ),
      // SnackBar(
      //   content: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Container(
      //         height: 50.0,
      //         width: 4.0,
      //         color: leftBarIndicatorColor,
      //       ),
      //       const SizedBox(width: 16.0),
      //       Expanded(
      //         child: ScaleText(
      //           message,
      //           maxLines: 2,
      //         ),
      //       ),
      //       const SizedBox(width: 8.0),
      //     ],
      //   ),
      //   padding: EdgeInsets.zero,
      //   backgroundColor: ColorsManager.snackBarBackground,
      //   duration: const Duration(seconds: 3),
      // ),
    );
  }

  Future<void> showAdaptiveDialog({
    required BuildContext context,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
  }) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        if (Platform.isIOS) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: CupertinoAlertDialog(
              title: title,
              content: content,
              actions: actions ?? [],
            ),
          );
        }
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: AlertDialog(
            title: title,
            content: content,
            actions: actions,
          ),
        );
      },
    );
  }

  Widget customLoadingItem() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  void showLoading() {
    LoadingPlusController().show();
  }

  void dismissLoading() {
    LoadingPlusController().dismiss();
  }

  Center loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  bool isRTL() {
    return Bidi.isRtlLanguage(Get.locale!.languageCode);
  }

  bool isDark() {
    return theme.colorScheme.brightness == Brightness.dark;
  }

  SystemUiOverlayStyle systemUiOverlayStyle({
    Color? statusBarColor,
    Brightness? statusBarBrightness,
    Brightness? statusBarIconBrightness,
  }) {
    return SystemUiOverlayStyle(
      statusBarColor: statusBarColor ?? theme.colorScheme.primary,
      statusBarBrightness: statusBarBrightness ?? (isDark() ? Brightness.dark : Brightness.light),
      statusBarIconBrightness:
          statusBarIconBrightness ?? (isDark() ? Brightness.dark : Brightness.light),
    );
  }

  Future<bool> checkConnection() {
    return InternetConnectionChecker.instance.hasConnection;
  }

  // Future<CroppedFile?> cropImage({required String path, bool isLogo = false}) async {
  //   CroppedFile? croppedFile = await ImageCropper().cropImage(
  //     sourcePath: path,
  //     cropStyle: isLogo ? CropStyle.circle : CropStyle.rectangle,
  //     compressQuality: 100,
  //     compressFormat: isLogo ? ImageCompressFormat.png : ImageCompressFormat.jpg,
  //     aspectRatio: isLogo
  //         ? const CropAspectRatio(ratioX: 1, ratioY: 1)
  //         : const CropAspectRatio(ratioX: 16, ratioY: 9),
  //     uiSettings: [
  //       AndroidUiSettings(
  //         toolbarTitle: localizations.chooseHowImageWillDisplayed,
  //         toolbarColor: theme.colorScheme.primary,
  //         toolbarWidgetColor: customTheme.white,
  //         lockAspectRatio: true,
  //       ),
  //       IOSUiSettings(
  //         title: localizations.chooseHowImageWillDisplayed,
  //         aspectRatioLockEnabled: true,
  //         resetAspectRatioEnabled: false,
  //         aspectRatioPickerButtonHidden: true,
  //         resetButtonHidden: true,
  //       ),
  //     ],
  //   );
  //   return croppedFile;
  // }

  Future<TimeOfDay?> timePicker(BuildContext context, {TimeOfDay? initialTime}) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: initialTime ?? const TimeOfDay(hour: 8, minute: 0),
      helpText: localizations.chooseTheTime,
      builder: (context, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Theme(
            data: isDark()
                ? ThemeData.dark().copyWith(
                    colorScheme: ColorScheme.light(
                      primary: theme.colorScheme.primary,
                      onSurface: customTheme.grey,
                    ),
                    buttonTheme: ButtonThemeData(
                      colorScheme: ColorScheme.light(
                        primary: theme.colorScheme.primary,
                      ),
                    ),
                    timePickerTheme: TimePickerThemeData(
                      backgroundColor: theme.colorScheme.surface,
                      helpTextStyle: TextStyle(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  )
                : ThemeData.light().copyWith(
                    colorScheme: ColorScheme.light(
                      primary: theme.colorScheme.primary,
                      onSurface: customTheme.grey,
                    ),
                    buttonTheme: ButtonThemeData(
                      colorScheme: ColorScheme.light(
                        primary: theme.colorScheme.primary,
                      ),
                    ),
                    timePickerTheme: TimePickerThemeData(
                      backgroundColor: theme.colorScheme.surface,
                      helpTextStyle: TextStyle(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
            child: child!,
          ),
        );
      },
    );
    return time;
  }

  Future<DateTime?> datePicker(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 90)),
      locale: Get.locale!,
      builder: (BuildContext context, Widget? child) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Theme(
            data: isDark()
                ? ThemeData.dark().copyWith(
                    dialogBackgroundColor: customTheme.white,
                    colorScheme: ColorScheme.fromSwatch().copyWith(
                      primary: theme.colorScheme.primary,
                      onSurface: customTheme.black,
                    ),
                  )
                : ThemeData.light().copyWith(
                    dialogBackgroundColor: customTheme.white,
                    colorScheme: ColorScheme.fromSwatch().copyWith(
                      primary: theme.colorScheme.primary,
                      onSurface: customTheme.black,
                    ),
                  ),
            child: child!,
          ),
        );
      },
    );
    return dateTime;
  }

//  String getMobileNumberWithCountryCode({
//   required String phone,
//   required String countryCode,
// }) {
//   String phoneWithoutZero = phone;
//   if (phoneWithoutZero[0] == '0') {
//     phoneWithoutZero = phoneWithoutZero.replaceFirst('0', '');
//   }
//   return '$countryCode$phoneWithoutZero';
// }

  Future<void> bottomSheet({
    required BuildContext context,
    required Widget child,
    bool showCancel = true,
    List<CustomBottomSheetButton>? actions,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Theme(
            data: theme.copyWith(
              bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.transparent,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              bottomSheet: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: customTheme.filled,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: child,
                      ),
                      const SizedBox(height: 16.0),
                      if (actions != null) ...actions,
                      if (showCancel)
                        CustomBottomSheetButton(
                          title: localizations.cancel,
                          titleColor: customTheme.error,
                          onTap: () {
                            Get.back();
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

enum SnackBarStatus {
  success,
  error,
  warning,
  none,
}

enum SnackBarPosition {
  top,
  bottom,
}
