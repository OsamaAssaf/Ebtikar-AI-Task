import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NavigationController(),
    );
  }
}
