import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });

  final HomeController homeController = Get.put(
    HomeController(
      videoRepository: VideoApi(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveDesign(
      mobile: AnnotatedRegion<SystemUiOverlayStyle>(
        value: Components().systemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
          body: GetBuilder<HomeController>(
            builder: (HomeController controller) {
              if (controller.isLoading) {
                return VideoLoading();
              }
              if (controller.videoList.isEmpty) {
                return EmptyVideosList();
              }
              return VideosList(
                videoList: controller.videoList,
                onRefresh: () async {
                  await controller.getVideos();
                },
                onPageChanged: controller.onPageChanged,
              );
            },
          ),
        ),
      ),
    );
  }
}
