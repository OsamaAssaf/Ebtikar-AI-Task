import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class ProfileController extends GetxController {
  late UserModel userModel;

  final DateFormat dateOfBirthFormat = DateFormat('dd/MM/yyyy');

  @override
  void onInit() {
    userModel = Globals().userModel!;
    super.onInit();
  }
}
