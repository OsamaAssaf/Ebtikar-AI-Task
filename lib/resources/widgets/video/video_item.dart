import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class VideoItem extends StatefulWidget {
  const VideoItem({
    super.key,
    required this.videoModel,
  });

  final VideoModel videoModel;

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  @override
  void initState() {
    widget.videoModel.videoPlayerController ??= VideoPlayerController.networkUrl(
      Uri.parse('${widget.videoModel.videoUrl}'),
    );
    if (widget.videoModel.videoPlayerController!.value.isInitialized) {
      initVideoControls();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!widget.videoModel.videoPlayerController!.value.isInitialized) {
          await widget.videoModel.videoPlayerController!.initialize();
        }
        initVideoControls();

        setState(() {});
      });
    }

    super.initState();
  }

  void initVideoControls() {
    widget.videoModel.videoPlayerController!.setLooping(true);
    widget.videoModel.videoPlayerController!.play();
  }

  @override
  void dispose() {
    widget.videoModel.videoPlayerController?.dispose();
    widget.videoModel.videoPlayerController = null;
    super.dispose();
  }

  void playPause() {
    widget.videoModel.videoPlayerController!.value.isPlaying
        ? widget.videoModel.videoPlayerController!.pause()
        : widget.videoModel.videoPlayerController!.play();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.videoModel.videoPlayerController!.value.isInitialized) {
      return VideoLoading();
    }

    return Stack(
      children: [
        GestureDetector(
          onTap: playPause,
          child: VideoPlayer(
            widget.videoModel.videoPlayerController!,
          ),
        ),
        GestureDetector(
          onTap: playPause,
          child: ControlsOverlay(
            controller: widget.videoModel.videoPlayerController!,
          ),
        ),
        VideoIndicator(
          controller: widget.videoModel.videoPlayerController!,
        ),
        VideoContent(
          videoModel: widget.videoModel,
        ),
        SideIcons(
          videoModel: widget.videoModel,
        ),
      ],
    );
  }
}
