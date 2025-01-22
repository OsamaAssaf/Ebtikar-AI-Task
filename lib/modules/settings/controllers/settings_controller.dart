import 'package:restart_app/restart_app.dart';
import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SettingsController extends GetxController {
  late GlobalKey<FormState> deActivateAccountKey;
  late TextEditingController deleteAccountPasswordController;

  @override
  void onInit() {
    deActivateAccountKey = GlobalKey<FormState>();
    deleteAccountPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    deleteAccountPasswordController.dispose();
    super.onClose();
  }

  bool isNotificationsOn = true;
  void changeIsNotificationsOn(bool value) {
    isNotificationsOn = value;
    update();
  }

  String? currentLanguage = SharedPrefsService().getLanguage();
  Future<void> changeLanguage(String value) async {
    await Get.updateLocale(Locale(value));
    currentLanguage = value;
    update();
    await SharedPrefsService().setLanguage(value);
    Get.offAllNamed(Routes.splashRoute);
  }

  bool obscureDeleteAccountPassword = true;
  void changeObscureDeleteAccountPassword() {
    obscureDeleteAccountPassword = !obscureDeleteAccountPassword;
    update();
  }

  Future<void> deActivateAccount(String password) async {
    // if (!deActivateAccountKey.currentState!.validate()) return;
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      // Components().showLoading();
      // await userRepository.deActivateAccount(password);
      // Components().dismissLoading();
      // Get.toNamed(
      //   Routes.splashRoute,
      // );
      Get.back();
      Components().snackBar(
        message: localizations.accountDeletedSuccessfully,
        snackBarStatus: SnackBarStatus.success,
      );
    } catch (_) {
      Components().dismissLoading();
      ExceptionManager().showException();
    }
  }

  ThemeMode currentTheme = SharedPrefsService().getThemeMode();
  void changeTheme(ThemeMode value, BuildContext context) {
    Components().showAdaptiveDialog(
      context: context,
      title: ScaleText(
        localizations.applicationWillRestart,
        style: theme.textTheme.bodyLarge,
        isFromDialog: true,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: ScaleText(
            localizations.no,
            isFromDialog: true,
          ),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () async {
            await SharedPrefsService().saveThemeMode(value);
            currentTheme = value;
            update();
            Restart.restartApp();
          },
          child: ScaleText(
            localizations.yes,
            isFromDialog: true,
          ),
        ),
      ],
    );
  }
}
