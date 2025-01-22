import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class EmptyVideosList extends StatelessWidget {
  const EmptyVideosList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            IconsManager.noVideosSvg,
            width: SizeManager.hugeIcon,
          ),
          const SizedBox(height: SizeManager.veryLargeSpacing),
          ScaleText(
            localizations.noVideosYet,
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: SizeManager.mediumSpacing),
          ScaleText(
            localizations.theVideosWillAppearHereWhenAvailable,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: customTheme.greyText,
            ),
          ),
        ],
      ),
    );
  }
}
