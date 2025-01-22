import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  // final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          appBar: MainAppBar(
            title: localizations.profile,
            canBack: true,
            showBottomLine: false,
            backgroundColor: theme.colorScheme.primary,
            preferredAdditionalSize: 3,
          ),
          body: Skeletonizer(
            enabled: false,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height * 0.07,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Positioned(
                      bottom: (Get.height * 0.07) * -0.35 - 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: Get.width * 0.75,
                          height: Get.height * 0.07,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: customTheme.filled,
                            borderRadius: BorderRadius.circular(24.0),
                            border: Border.all(
                              color: customTheme.grey.withValues(alpha: 0.3),
                              width: 1.0,
                            ),
                          ),
                          child: ScaleText(
                            '${controller.userModel!.fullName}',
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: customTheme.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.03),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: controller.fullNameController,
                            label: localizations.fullName,
                            prefixIcon: Icon(
                              FontAwesomeIcons.signature,
                              color: theme.colorScheme.primary,
                              size: ConstantsManager.iconSize,
                            ),
                            hint: 'Ahmad, Ali, ...',
                            textInputType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: ValidatorsManager().validateNotEmpty,
                          ),
                          const SizedBox(height: 8.0),
                          CustomTextField(
                            controller: controller.emailController,
                            hint: 'Example@email.com',
                            prefixIcon: Icon(
                              FontAwesomeIcons.envelope,
                              color: theme.colorScheme.primary,
                              size: ConstantsManager.iconSize,
                            ),
                            label: localizations.email,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: ValidatorsManager().validateEmail,
                          ),
                          const SizedBox(height: 8.0),
                          PhoneTextField(
                            controller: controller.phoneNumberController,
                            selectedCountryFlag: controller.selectedCountryFlag,
                            onSelect: (Country country) {
                              controller.changeCountryPicker(
                                countryCode: country.countryCode,
                                countryFlag: country.flagEmoji,
                                phoneCode: country.phoneCode,
                              );
                            },
                            textInputAction: TextInputAction.done,
                          ),
                          const SizedBox(height: 8.0),
                          ExpansionTile(
                            dense: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: customTheme.grey,
                                width: 1.0,
                              ),
                            ),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: customTheme.grey,
                                width: 0.1,
                              ),
                            ),
                            tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                            title: Row(
                              children: [
                                Icon(
                                  Icons.lock_outline_rounded,
                                  color: theme.colorScheme.primary,
                                  size: ConstantsManager.iconSize,
                                ),
                                const SizedBox(width: 14.0),
                                ScaleText(
                                  localizations.password,
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            iconColor: customTheme.black,
                            collapsedIconColor: customTheme.lightGrey,
                            // backgroundColor: customTheme.textFieldBackground,
                            backgroundColor: theme.colorScheme.surface,
                            collapsedBackgroundColor: customTheme.filled,

                            childrenPadding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              top: 0,
                              bottom: 8.0,
                            ),
                            children: [
                              Divider(
                                color: theme.colorScheme.surface,
                                thickness: 3.0,
                              ),
                              const SizedBox(height: 8.0),
                              CustomTextField(
                                controller: controller.oldPasswordController,
                                label: localizations.oldPassword,
                                obscureText: controller.obscureOldPassword,
                                textInputType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.next,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    controller.changeObscureOldPassword();
                                  },
                                  child: Icon(
                                    controller.obscureOldPassword
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.visibility_off_outlined,
                                    color: customTheme.greyIcon,
                                    size: ConstantsManager.iconSize,
                                  ),
                                ),
                                validator: ValidatorsManager().validatePassword,
                              ),
                              const SizedBox(height: 8.0),
                              CustomTextField(
                                controller: controller.newPasswordController,
                                label: localizations.newPassword,
                                obscureText: controller.obscureNewPassword,
                                textInputType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.next,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    controller.changeObscureNewPassword();
                                  },
                                  child: Icon(
                                    controller.obscureNewPassword
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.visibility_off_outlined,
                                    color: customTheme.greyIcon,
                                    size: ConstantsManager.iconSize,
                                  ),
                                ),
                                validator: ValidatorsManager().validatePassword,
                              ),
                              const SizedBox(height: 8.0),
                              CustomTextField(
                                controller: controller.confirmPasswordController,
                                label: localizations.confirmPassword,
                                obscureText: controller.obscureReTypePassword,
                                textInputType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    controller.changeObscureReTypePassword();
                                  },
                                  child: Icon(
                                    controller.obscureReTypePassword
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.visibility_off_outlined,
                                    color: customTheme.greyIcon,
                                    size: ConstantsManager.iconSize,
                                  ),
                                ),
                                validator: ValidatorsManager().validatePassword,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
