import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class ViewSingleVideoController extends GetxController {
  late VideoModel videoModel;

  @override
  void onInit() {
    videoModel = Get.arguments['videoModel'];
    super.onInit();
  }
}
