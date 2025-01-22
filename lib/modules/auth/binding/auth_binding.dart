import 'package:ebtikar_ai_task/repositories/auth/auth_fake.dart';
import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthController(
        // authRepository: AuthApi(),
        authRepository: AuthFake(),
      ),
    );
  }
}
