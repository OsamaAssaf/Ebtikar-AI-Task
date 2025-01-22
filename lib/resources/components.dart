import 'dart:ui';

import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class Components {
  Components._();

  static final Components _instance = Components._();

  factory Components() => _instance;

  void snackBar({
    required String message,
    SnackBarStatus snackBarStatus = SnackBarStatus.warning,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color? leftBarIndicatorColor;
    switch (snackBarStatus) {
      case SnackBarStatus.success:
        leftBarIndicatorColor = ColorsManager.success;
        break;
      case SnackBarStatus.error:
        leftBarIndicatorColor = ColorsManager.error;
        break;
      case SnackBarStatus.warning:
        leftBarIndicatorColor = ColorsManager.warning;
        break;
      default:
        leftBarIndicatorColor = null;
        break;
    }
    final SnackBar snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50.0,
            width: 4.0,
            color: leftBarIndicatorColor,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: ScaleText(
              message,
              maxLines: 2,
            ),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      padding: EdgeInsets.zero,
      backgroundColor: customTheme.secondaryBackground,
      duration: const Duration(seconds: 3),
    );

    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    scaffoldMessengerKey.currentState!.showSnackBar(
      snackBar,
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
