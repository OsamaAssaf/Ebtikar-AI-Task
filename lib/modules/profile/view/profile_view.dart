import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final ProfileController profileController = Get.put(
    ProfileController(),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          appBar: MainAppBar(
            title: localizations.profile,
          ),
          body: Padding(
            padding: const EdgeInsets.all(SizeManager.regularSpacing),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
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
                        '${controller.userModel.fullName}',
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: customTheme.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeManager.regularSpacing),
                  ScaleText(
                    '${controller.userModel.email}',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: customTheme.black,
                    ),
                  ),
                  SizedBox(height: SizeManager.regularSpacing),
                  ScaleText(
                    controller.dateOfBirthFormat.format(controller.userModel.dateOfBirth!),
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: customTheme.black,
                    ),
                  ),
                  Divider(
                    color: customTheme.secondaryBackground,
                    thickness: 0.5,
                    height: SizeManager.semiLargeSpacing,
                  ),
                  ListTile(
                    title: ScaleText(localizations.settings),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: SizeManager.regularIcon,
                    ),
                    onTap: () {
                      Get.toNamed(Routes.settingsRoute);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
