import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SavedVideosController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getSavedVideos();
    });

    super.onInit();
  }

  bool isLoading = true;
  List<VideoModel> videoList = [];

  Future<void> getSavedVideos() async {
    try {
      isLoading = true;
      update();
      videoList = SharedPrefsService().getSavedVideos();
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
