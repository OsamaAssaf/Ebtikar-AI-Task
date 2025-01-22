import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class VideoContent extends StatelessWidget {
  const VideoContent({
    super.key,
    required this.videoModel,
  });

  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return PositionedDirectional(
      bottom: SizeManager.mediumSpacing,
      start: SizeManager.mediumSpacing,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ScaleText(
            '@${videoModel.username}',
            maxLines: 1,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: customTheme.whiteText,
            ),
          ),
          const SizedBox(height: SizeManager.regularSpacing),
          ScaleText(
            '${videoModel.title}',
            maxLines: 1,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: customTheme.whiteText,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: SizeManager.smallSpacing),
          SizedBox(
            width: width * 0.70,
            child: DefaultTextStyle(
              style: theme.textTheme.bodyMedium!.copyWith(
                color: customTheme.whiteText,
              ),
              child: ReadMoreText(
                '${videoModel.description}',
                trimMode: TrimMode.Line,
                trimLines: 2,
                trimCollapsedText: ' ${localizations.showMore}',
                trimExpandedText: ' ${localizations.showLess}',
                moreStyle: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.primary,
                ),
                lessStyle: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
