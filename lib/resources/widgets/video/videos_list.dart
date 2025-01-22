import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class VideosList extends StatelessWidget {
  const VideosList({
    super.key,
    required this.videoList,
    required this.onRefresh,
    this.onPageChanged,
  });

  final List<VideoModel> videoList;
  final Future<void> Function() onRefresh;
  final void Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: videoList.length,
        onPageChanged: onPageChanged,
        itemBuilder: (BuildContext context, int index) {
          final VideoModel videoModel = videoList.elementAt(index);
          return VideoItem(videoModel: videoModel);
        },
      ),
    );
  }
}
