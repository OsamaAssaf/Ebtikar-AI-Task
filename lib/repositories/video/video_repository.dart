import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

abstract class VideoRepository {
  Future<List<VideoModel>> getVideos();
}
