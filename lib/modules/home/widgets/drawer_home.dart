import 'dart:ui';

import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: Drawer(
        surfaceTintColor: Colors.transparent,
        backgroundColor: theme.colorScheme.surface,
        width: 260.0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                arrowColor: theme.colorScheme.surface,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                ),
                margin: const EdgeInsets.all(0.0),
                accountName: GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.profileRoute);
                  },
                  child: Text(
                    'User Name',
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.colorScheme.surface,
                    ),
                  ),
                ),
                accountEmail: GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.profileRoute);
                  },
                  child: Text(
                    'user@example.com',
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: theme.colorScheme.surface,
                    ),
                  ),
                ),
                currentAccountPicture: GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.profileRoute);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.surface,
                        width: 0.1,
                      ),
                      image: DecorationImage(
                        image: AssetImage(IconsManager.appIcon),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // child: CircleAvatar(
                  //   radius: 35,
                  //   backgroundColor: theme.colorScheme.surface,
                  //   child: CircleAvatar(
                  //     backgroundColor: theme.colorScheme.primary,
                  //     radius: 34,
                  //     backgroundImage: AssetImage(IconsManager.appIcon),
                  //   ),
                  // ),
                ),
                otherAccountsPictures: [
                  ScaleText(
                    localizations.appName,
                    textAlign: TextAlign.end,
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.colorScheme.surface,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
                otherAccountsPicturesSize: Size.square(Get.width * 0.50),
              ),
              ListTile(
                title: Text(
                  localizations.rateApp,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.star_border_rounded,
                  color: customTheme.black,
                  size: ConstantsManager.iconSize,
                ),
                onTap: rateApp,
              ),
              ListTile(
                title: Text(
                  localizations.inviteFriend,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.share_outlined,
                  color: customTheme.black,
                  size: ConstantsManager.iconSize,
                ),
                onTap: shareApp,
              ),
              ListTile(
                title: Text(
                  localizations.feedback,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.feedback_outlined,
                  color: customTheme.black,
                  size: ConstantsManager.iconSize,
                ),
                onTap: () {
                  sendFeedback(context);
                },
              ),
              ListTile(
                title: Text(
                  localizations.termsAndConditions,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.privacy_tip_outlined,
                  color: customTheme.black,
                  size: ConstantsManager.iconSize,
                ),
                onTap: openTermsAndConditions,
              ),
              ListTile(
                title: Text(
                  localizations.settings,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.settings_suggest_outlined,
                  color: customTheme.black,
                  size: ConstantsManager.iconSize,
                ),
                onTap: () {
                  Get.toNamed(Routes.settingsRoute);
                },
              ),
              ListTile(
                title: Text(
                  localizations.logOut,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: customTheme.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.logout_outlined,
                  color: customTheme.black,
                  size: ConstantsManager.iconSize,
                ),
                onTap: () {
                  logoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> shareApp() async {
    try {
      Components().showLoading();
      await Share.share(ConstantsManager.shareText);
    } catch (_) {
      Components().snackBar(message: localizations.somethingWrongTryAgain);
    } finally {
      Components().dismissLoading();
    }
  }

  Future<void> rateApp() async {
    try {
      Components().showLoading();
      final InAppReview inAppReview = InAppReview.instance;

      await inAppReview.openStoreListing(
        appStoreId: ConstantsManager.appStoreId,
      );
      Components().dismissLoading();
    } catch (_) {
      Components().dismissLoading();
      Components().snackBar(message: localizations.somethingWrongTryAgain);
    }
  }

  Future<void> sendFeedback(BuildContext context) async {
    final TextEditingController feedbackController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Components().showAdaptiveDialog(
      context: context,
      title: Image.asset(
        IconsManager.appIcon,
        height: 70.0,
        width: 70.0,
        fit: BoxFit.contain,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8.0),
          Center(
            child: Text(
              localizations.sendYourFeedback,
              style: theme.textTheme.titleLarge!.copyWith(
                color: customTheme.black,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Form(
            key: formKey,
            child: CustomTextField(
              controller: feedbackController,
              minLines: 3,
              maxLines: 5,
              label: localizations.writeHere,
              validator: ValidatorsManager().validateNotEmpty,
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(localizations.cancel),
        ),
        FilledButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            side: BorderSide(
              color: theme.colorScheme.primary,
              width: 1.0,
            ),
          ),
          child: Text(
            localizations.send,
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.surface,
            ),
          ),
          onPressed: () async {
            if (!formKey.currentState!.validate()) return;
            // final FeedbackRepository feedbackRepository = FeedbackApi();
            // try {
            //   Components().showLoading();
            //   await feedbackRepository
            //       .sendFeedback(feedbackController.text.trim());
            //   Components().dismissLoading();
            //   Get.back();
            //   Components().snackBar(
            //     message: localizations.feedbackSent,
            //     snackBarStatus: SnackBarStatus.success,
            //   );
            // } catch (_) {
            //   Components().dismissLoading();
            //   Components().snackBar(
            //       message: localizations.somethingWrongTryAgain);
            // }
          },
        ),
      ],
    );
  }

  Future<void> openTermsAndConditions() async {
    try {
      Components().showLoading();
      await launchUrl(
        Uri.parse(ConstantsManager.termsAndConditionsUrl),
        mode: LaunchMode.externalApplication,
      );
      Components().dismissLoading();
    } catch (_) {
      Components().dismissLoading();
      Components().snackBar(message: localizations.somethingWrongTryAgain);
    }
  }

  Future<void> logoutDialog(BuildContext context) async {
    final ScaleText title = ScaleText(
      localizations.logOut,
      style: theme.textTheme.titleLarge!.copyWith(
        color: customTheme.black,
      ),
      isFromDialog: true,
    );
    final ScaleText content = ScaleText(
      localizations.areYouSureLogOut,
      style: theme.textTheme.titleMedium!.copyWith(
        color: customTheme.error,
      ),
      isFromDialog: true,
    );
    final List<Widget> actions = [
      TextButton(
        onPressed: () {
          Get.offAllNamed(Routes.authRoute);
        },
        child: ScaleText(
          localizations.yes,
          style: theme.textTheme.titleLarge!.copyWith(
            color: customTheme.black,
          ),
          isFromDialog: true,
        ),
      ),
      FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          Get.back();
        },
        child: ScaleText(
          localizations.no,
          style: theme.textTheme.titleLarge!.copyWith(
            color: customTheme.black,
          ),
          isFromDialog: true,
        ),
      ),
    ];
    Components().showAdaptiveDialog(
      context: context,
      title: title,
      content: content,
      actions: actions,
    );
  }
}
