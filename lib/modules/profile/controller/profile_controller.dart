import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class ProfileController extends GetxController {
  final UserModel? userModel = Globals().userModel;

  late GlobalKey<FormState> formKey;

  late TextEditingController fullNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneNumberController;

  late TextEditingController dateOfBirthController;

  final DateFormat dateOfBirthFormat = DateFormat('dd/MM/yyyy');

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();

    fullNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneNumberController = TextEditingController();
    dateOfBirthController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    dateOfBirthController.dispose();
    super.onClose();
  }

  int? selectedGender;
  set setSelectedGender(int newValue) {
    selectedGender = newValue;
    update();
  }

  DateTime? dateOfBirth;
  void onDateOfBirthSelected(DateTime dateTime) {
    dateOfBirthController.text = dateOfBirthFormat.format(dateTime);
    dateOfBirth = dateTime;
  }

  bool obscureOldPassword = true;
  void changeObscureOldPassword() {
    obscureOldPassword = !obscureOldPassword;
    update();
  }

  bool obscureNewPassword = true;
  void changeObscureNewPassword() {
    obscureNewPassword = !obscureNewPassword;
    update();
  }

  bool obscureReTypePassword = true;
  void changeObscureReTypePassword() {
    obscureReTypePassword = !obscureReTypePassword;
    update();
  }

  String selectedCountryCode = 'JO';
  String selectedCountryFlag = '🇯🇴';
  String selectedPhoneCode = '962';
  void changeCountryPicker({
    required String countryCode,
    required String countryFlag,
    required String phoneCode,
  }) {
    selectedCountryCode = countryCode;
    selectedCountryFlag = countryFlag;
    selectedPhoneCode = phoneCode;
    update();
  }
}
