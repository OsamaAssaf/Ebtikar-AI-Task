import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkConnection();
    });
    super.onInit();
  }

  Future<void> checkConnection() async {
    final bool result = await Components().checkConnection();
    if (result == true) {
      final UserModel userModel = UserModel(
        id: 1,
        fullName: 'Osama Assaf',
        email: 'osama.assaf.o@gmail.com',
        dateOfBirth: DateTime(2000, 2, 3),
      );
      Globals().changeUserModel(userModel);
      Get.offAllNamed(Routes.navigationRoute);
    } else {
      Get.offAllNamed(Routes.connectionErrorRoute);
    }
  }
}
