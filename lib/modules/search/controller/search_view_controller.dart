import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SearchViewController extends GetxController {
  List<VideoModel> searchResultList = [];

  void searchVideos(String searchText) {
    if (searchText.trim().isEmpty) return;
    final String text = searchText.toLowerCase();
    try {
      final HomeController homeController = Get.find();
      searchResultList = homeController.videoList.where((video) {
        return video.title.toString().toLowerCase().contains(text) ||
            video.description.toString().toLowerCase().contains(text) ||
            video.username.toString().toLowerCase().contains(text) ||
            video.category.toString().toLowerCase().contains(text);
      }).toList();
      update();
    } catch (_) {}
  }
}
