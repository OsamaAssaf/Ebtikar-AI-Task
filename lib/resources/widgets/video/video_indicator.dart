import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class VideoIndicator extends StatelessWidget {
  const VideoIndicator({
    super.key,
    required this.controller,
  });
  final VideoPlayerController controller;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: VideoProgressIndicator(
        controller,
        allowScrubbing: false,
        colors: VideoProgressColors(
          playedColor: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
