import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class HomeController extends GetxController {
  final VideoRepository videoRepository;

  HomeController({required this.videoRepository});

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getVideos();
    });

    super.onInit();
  }

  bool isLoading = true;
  List<VideoModel> videoList = [];

  Future<void> getVideos() async {
    try {
      isLoading = true;
      update();
      videoList = await videoRepository.getVideos();
      if (videoList.isNotEmpty) {
        await initVideoController(0);
        if (videoList.length > 1) {
          await initVideoController(1);
        }
      }
    } catch (_) {
      ExceptionManager().showException();
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> initVideoController(int index) async {
    final VideoModel videoModel = videoList.elementAt(index);
    videoModel.videoPlayerController?.dispose();
    videoModel.videoPlayerController = null;
    videoModel.videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse('${videoModel.videoUrl}'),
    );
    await videoModel.videoPlayerController!.initialize();
  }

  void onPageChanged(int index) {
    if (index < videoList.length - 1) {
      initVideoController(index + 1);
    }
  }
}
