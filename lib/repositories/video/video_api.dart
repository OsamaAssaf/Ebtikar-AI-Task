import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class VideoApi extends VideoRepository {
  final String getVideosEndpoint = DotenvManager.getVideosEndpoint;

  @override
  Future<List<VideoModel>> getVideos() async {
    final String endpoint = getVideosEndpoint;

    final ({int statusCode, dynamic decodedBody}) response = await ApiServices().get(
      endpoint: endpoint,
    );
    final List<VideoModel> result = [];
    for (final video in response.decodedBody) {
      result.add(VideoModel.fromJson(video));
    }
    return result;
  }
}
