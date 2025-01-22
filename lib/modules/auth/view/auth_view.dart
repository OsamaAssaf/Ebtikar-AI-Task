import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  // vertical: 8.0,
                ),
                sliver: SliverList.list(
                  children: [
                    const SizedBox(height: 16.0),
                    Container(
                      width: Get.width * 0.2,
                      height: Get.width * 0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(IconsManager.appIcon),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Center(
                      child: ScaleText(
                        localizations.appName,
                        style: theme.textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    SizedBox(height: controller.authType == AuthType.login ? 64.0 : 32.0),
                    Row(
                      children: [
                        ScaleText(
                          localizations.welcome,
                          style: theme.textTheme.displayMedium!.copyWith(
                            color: customTheme.blackText,
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                    // const SizedBox(height: 32.0),
                    GetBuilder<AuthController>(
                      builder: (controller) {
                        return AutofillGroup(
                          child: Column(
                            children: [
                              if (controller.authType == AuthType.signUp) ...[
                                const SizedBox(height: 16.0),
                                CustomTextField(
                                  controller: controller.nameController,
                                  label: localizations.fullName,
                                  textInputType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  autofillHints: const [
                                    AutofillHints.name,
                                  ],
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.signature,
                                    color: theme.colorScheme.primary,
                                    size: ConstantsManager.iconSize,
                                  ),
                                  validator: ValidatorsManager().validateName,
                                ),
                              ],
                              const SizedBox(height: 8.0),
                              CustomTextField(
                                controller: controller.emailController,
                                label: localizations.email,
                                textInputType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                autofillHints: [
                                  if (controller.authType == AuthType.login) AutofillHints.username,
                                  if (controller.authType == AuthType.signUp)
                                    AutofillHints.newUsername,
                                ],
                                prefixIcon: Icon(
                                  FontAwesomeIcons.envelope,
                                  color: theme.colorScheme.primary,
                                  size: ConstantsManager.iconSize,
                                ),
                                validator: ValidatorsManager().validateEmail,
                              ),
                              const SizedBox(height: 8.0),
                              if (controller.authType == AuthType.signUp) ...[
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
                              ],
                              CustomTextField(
                                controller: controller.passwordController,
                                label: localizations.password,
                                obscureText: !controller.showPassword,
                                textInputType: TextInputType.visiblePassword,
                                textInputAction: controller.authType == AuthType.login
                                    ? TextInputAction.done
                                    : TextInputAction.next,
                                autofillHints: const [
                                  AutofillHints.password,
                                ],
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  color: theme.colorScheme.primary,
                                  size: ConstantsManager.iconSize,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: controller.changeShowPassword,
                                  icon: Icon(
                                    controller.showPassword
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    color: customTheme.greyIcon,
                                    size: ConstantsManager.iconSize,
                                  ),
                                ),
                                validator: ValidatorsManager().validatePassword,
                                onFieldSubmitted: (_) {
                                  if (controller.authType == AuthType.login) {
                                    return;
                                  }

                                  controller.confirmPasswordNode.requestFocus();
                                },
                              ),
                              if (controller.authType == AuthType.signUp) ...[
                                const SizedBox(height: 8.0),
                                CustomTextField(
                                  controller: controller.confirmPasswordController,
                                  label: localizations.confirmPassword,
                                  obscureText: !controller.showConfirmPassword,
                                  focusNode: controller.confirmPasswordNode,
                                  textInputType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                  autofillHints: const [
                                    AutofillHints.password,
                                  ],
                                  prefixIcon: Icon(
                                    Icons.lock_outline_rounded,
                                    color: theme.colorScheme.primary,
                                    size: ConstantsManager.iconSize,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: controller.changeConfirmShowPassword,
                                    icon: Icon(
                                      controller.showConfirmPassword
                                          ? FontAwesomeIcons.eye
                                          : FontAwesomeIcons.eyeSlash,
                                      color: customTheme.greyIcon,
                                      size: ConstantsManager.iconSize,
                                    ),
                                  ),
                                  validator: (String? value) {
                                    return ValidatorsManager().validateConfirmPassword(
                                      value,
                                      controller.passwordController.text,
                                    );
                                  },
                                ),
                                const SizedBox(height: 16.0),
                              ],
                              if (controller.authType == AuthType.login)
                                const SizedBox(height: 8.0),
                              SizedBox(
                                width: Get.width,
                                child: MainButton(
                                  title: controller.authType == AuthType.login
                                      ? localizations.login
                                      : localizations.createAccount,
                                  onPressed: controller.submit,
                                ),
                              ),
                              if (controller.authType == AuthType.login) ...[
                                const SizedBox(height: 64.0),
                              ] else ...[
                                const SizedBox(height: 16.0),
                              ],
                              Row(
                                children: [
                                  const Expanded(
                                    child: Divider(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: ScaleText(
                                      localizations.orSignUpWith,
                                      style: theme.textTheme.titleLarge!.copyWith(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: SocialLoginButton(
                                      text: localizations.google,
                                      svgIcon: IconsManager.googleSvg,
                                      onTap: controller.signInWithGoogle,
                                    ),
                                  ),
                                  if (!Platform.isIOS) ...[
                                    const SizedBox(width: 16.0),
                                    Expanded(
                                      child: SocialLoginButton(
                                        text: localizations.apple,
                                        icon: FontAwesomeIcons.apple,
                                        onTap: () {},
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              SizedBox(height: controller.authType == AuthType.login ? 64.0 : 32.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ScaleText(
                                    controller.authType == AuthType.login
                                        ? localizations.doNotHaveAnAccount
                                        : localizations.haveAnAccount,
                                    style: theme.textTheme.titleMedium,
                                    isFromDialog: true,
                                  ),
                                  const SizedBox(width: 4.0),
                                  InkWell(
                                    onTap: () {
                                      controller.changeAuthType();
                                    },
                                    child: ScaleText(
                                      controller.authType == AuthType.login
                                          ? localizations.createAccount
                                          : localizations.login,
                                      isFromDialog: true,
                                      style: theme.textTheme.titleMedium!.copyWith(
                                        color: theme.colorScheme.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: theme.colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Row(
                      //   children: [
                      //     const Expanded(
                      //       child: Divider(),
                      //     ),
                      //     Padding(
                      //       padding:
                      //           const EdgeInsets.symmetric(horizontal: 16.0),
                      //       child: ScaleText(
                      //         localizations.orSignUpWith,
                      //         style: theme.textTheme.titleLarge!.copyWith(
                      //           fontSize: 16.0,
                      //         ),
                      //       ),
                      //     ),
                      //     const Expanded(
                      //       child: Divider(),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 8.0),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: SocialLoginButton(
                      //         text: localizations.google,
                      //         icon: FontAwesomeIcons.google,
                      //         onTap: controller.signInWithGoogle,
                      //       ),
                      //     ),
                      //     if (!Platform.isIOS) ...[
                      //       const SizedBox(width: 16.0),
                      //       Expanded(
                      //         child: SocialLoginButton(
                      //           text: localizations.apple,
                      //           icon: FontAwesomeIcons.apple,
                      //           onTap: () {},
                      //         ),
                      //       ),
                      //     ],
                      //   ],
                      // ),

                      // const SizedBox(height: 16.0),
                      // Row(
                      //   children: [
                      //     ScaleText(
                      //       controller.authType == AuthType.login
                      //           ? localizations.doNotHaveAnAccount
                      //           : localizations.haveAnAccount,
                      //       style: theme.textTheme.titleMedium,
                      //       isFromDialog: true,
                      //     ),
                      //     const SizedBox(width: 4.0),
                      //     InkWell(
                      //       onTap: () {
                      //         controller.changeAuthType();
                      //       },
                      //       child: ScaleText(
                      //         controller.authType == AuthType.login
                      //             ? localizations.createAccount
                      //             : localizations.login,
                      //         isFromDialog: true,
                      //         style: theme.textTheme.titleMedium!.copyWith(
                      //           color: theme.colorScheme.primary,
                      //           decoration: TextDecoration.underline,
                      //           decorationColor: theme.colorScheme.primary,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
