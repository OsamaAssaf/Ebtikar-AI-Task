import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SideIcons extends StatelessWidget {
  const SideIcons({
    super.key,
    required this.videoModel,
  });
  final VideoModel videoModel;
  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      bottom: SizeManager.mediumSpacing,
      end: 0.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: theme.colorScheme.surface,
            ),
          ),
          IconButton(
            onPressed: () async {
              await SharedPrefsService().saveSavedVideos(videoModel);
              Components().snackBar(
                message: localizations.savedSuccessfully,
                snackBarStatus: SnackBarStatus.success,
              );
            },
            icon: Icon(
              Icons.save,
              color: theme.colorScheme.surface,
            ),
          ),
          IconButton(
            onPressed: () {
              try {
                Share.share(
                  '${localizations.checkOutThisVideo}: ${videoModel.videoUrl}',
                );
              } catch (_) {}
            },
            icon: Icon(
              Icons.share,
              color: theme.colorScheme.surface,
            ),
          ),
        ],
      ),
    );
  }
}
