import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final SettingsController settingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return Scaffold(
          appBar: MainAppBar(
            title: localizations.settings,
            canBack: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                GetBuilder<LanguageController>(
                  builder: (languageController) {
                    return SettingsDrawerItem(
                      title: localizations.language,
                      subtitle: languageController.selectedLanguageLabel,
                      icon: FontAwesomeIcons.language,
                      onTap: () {
                        Components().bottomSheet(
                          context: context,
                          child: GetBuilder<LanguageController>(
                            builder: (languageController) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: languageController.languageList.map(
                                  (e) {
                                    return RadioListTile.adaptive(
                                      value: e.code,
                                      title: ScaleText(
                                        e.name,
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                      groupValue: languageController.selectedLanguageCode,
                                      onChanged: (String? value) {
                                        languageController.changeLanguage(value!);
                                        Get.back();
                                      },
                                    );
                                  },
                                ).toList(),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
                // const SettingDivider(),
                // SettingItem(
                //   title: localizations.changeTheme,
                //   leading: Icon(
                //     Icons.color_lens_outlined,
                //     color: customTheme.blackText,
                //     size: ConstantsManager.iconSize,
                //   ),
                //   onTap: () {
                //     Components().bottomSheet(
                //       context: context,
                //       child: Column(
                //         children: [
                //           RadioListTile.adaptive(
                //             value: ThemeMode.system,
                //             groupValue: controller.currentTheme,
                //             controlAffinity: ListTileControlAffinity.trailing,
                //             secondary: Icon(
                //               Icons.auto_mode_outlined,
                //               color: theme.colorScheme.primary,
                //               size: ConstantsManager.iconSize,
                //             ),
                //             title: ScaleText(
                //               localizations.auto,
                //               style: theme.textTheme.bodyLarge,
                //             ),
                //             onChanged: (ThemeMode? value) {
                //               controller.changeTheme(value!, context);
                //             },
                //           ),
                //           RadioListTile.adaptive(
                //             value: ThemeMode.light,
                //             groupValue: controller.currentTheme,
                //             controlAffinity: ListTileControlAffinity.trailing,
                //             secondary: Icon(
                //               Icons.light_mode_outlined,
                //               color: theme.colorScheme.primary,
                //               size: ConstantsManager.iconSize,
                //             ),
                //             title: ScaleText(
                //               localizations.light,
                //               style: theme.textTheme.bodyLarge,
                //             ),
                //             onChanged: (ThemeMode? value) {
                //               controller.changeTheme(value!, context);
                //             },
                //           ),
                //           RadioListTile.adaptive(
                //             value: ThemeMode.dark,
                //             groupValue: controller.currentTheme,
                //             controlAffinity: ListTileControlAffinity.trailing,
                //             secondary: Icon(
                //               Icons.dark_mode_outlined,
                //               color: theme.colorScheme.primary,
                //               size: ConstantsManager.iconSize,
                //             ),
                //             title: ScaleText(
                //               localizations.dark,
                //               style: theme.textTheme.bodyLarge,
                //             ),
                //             onChanged: (ThemeMode? value) {
                //               controller.changeTheme(value!, context);
                //             },
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
