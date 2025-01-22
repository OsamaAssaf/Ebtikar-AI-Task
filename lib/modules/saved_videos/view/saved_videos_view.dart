import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SavedVideosView extends StatelessWidget {
  SavedVideosView({super.key});

  final SavedVideosController savedVideosController = Get.put(
    SavedVideosController(),
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveDesign(
      mobile: Scaffold(
        appBar: MainAppBar(
          title: localizations.savedVideos,
        ),
        body: GetBuilder<SavedVideosController>(
          builder: (SavedVideosController controller) {
            if (controller.isLoading) {
              return VideoLoading();
            }
            if (controller.videoList.isEmpty) {
              return EmptyVideosList();
            }
            return Padding(
              padding: const EdgeInsets.all(SizeManager.smallSpacing),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.getSavedVideos();
                },
                child: GridView.builder(
                  itemCount: controller.videoList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150.0,
                    crossAxisSpacing: SizeManager.smallSpacing,
                    mainAxisSpacing: SizeManager.smallSpacing,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final VideoModel videoModel = controller.videoList.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          Routes.viewSingleVideoRoute,
                          arguments: {
                            'videoModel': videoModel,
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: customTheme.greyBorder,
                          ),
                          borderRadius: BorderRadius.circular(SizeManager.mediumRadius),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(SizeManager.mediumRadius),
                          child: CachedNetworkImage(
                            imageUrl: '${videoModel.thumbnail}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
