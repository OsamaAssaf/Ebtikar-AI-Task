import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final SearchViewController searchViewController = Get.put(
    SearchViewController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(
          title: localizations.search,
        ),
        body: Padding(
          padding: const EdgeInsets.all(SizeManager.regularSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                onSubmitted: (String value) {
                  searchViewController.searchVideos(value);
                },
              ),
              const SizedBox(height: SizeManager.mediumSpacing),
              Expanded(
                child: GetBuilder(
                  builder: (SearchViewController controller) {
                    if (controller.searchResultList.isEmpty) {
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
                              localizations.searchForVideos,
                              style: theme.textTheme.titleSmall,
                            ),
                            const SizedBox(height: SizeManager.mediumSpacing),
                            ScaleText(
                              localizations.searchByTitleDescriptionUsernameAndCategory,
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
                    return ListView.separated(
                      itemCount: controller.searchResultList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final VideoModel videoModel = controller.searchResultList.elementAt(index);
                        return ListTile(
                          title: ScaleText('${videoModel.title}'),
                          subtitle: ScaleText('${videoModel.description}'),
                          onTap: () {
                            Get.toNamed(
                              Routes.viewSingleVideoRoute,
                              arguments: {
                                'videoModel': videoModel,
                              },
                            );
                          },
                        );
                      },
                      separatorBuilder: (_, __) {
                        return const SizedBox(height: SizeManager.regularSpacing);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
