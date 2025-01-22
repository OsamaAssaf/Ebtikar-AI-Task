import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late FocusNode confirmPasswordNode;
  late TextEditingController phoneNumberController;

  late TextEditingController dateOfBirthController;
  final DateFormat dateOfBirthFormat = DateFormat('dd/MM/yyyy');

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneNumberController = TextEditingController();
    confirmPasswordNode = FocusNode();
    dateOfBirthController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    confirmPasswordNode.dispose();
    phoneNumberController.dispose();
    dateOfBirthController.dispose();
    super.onClose();
  }

  AuthType authType = AuthType.login;
  bool showPassword = true;
  bool showConfirmPassword = true;

  void changeAuthType() {
    authType = authType == AuthType.login ? AuthType.signUp : AuthType.login;
    update();
  }

  void changeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void changeConfirmShowPassword() {
    showConfirmPassword = !showConfirmPassword;
    update();
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

  Future<void> submit() async {
    final UserModel userModel = UserModel(
      id: 1,
      fullName: 'Username',
    );
    Globals().changeUserModel(userModel);
    Get.offAllNamed(Routes.navigationRoute);
  }

  Future<void> signInWithGoogle() async {
    final UserModel userModel = UserModel(
      id: 1,
      fullName: 'Username',
    );
    Globals().changeUserModel(userModel);
    Get.offAllNamed(Routes.navigationRoute);
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

  Future<void> openTermsAndConditions() async {}
}
