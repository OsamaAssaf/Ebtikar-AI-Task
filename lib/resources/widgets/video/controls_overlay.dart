import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class ControlsOverlay extends StatelessWidget {
  const ControlsOverlay({super.key, required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 50),
      reverseDuration: const Duration(milliseconds: 200),
      child: controller.value.isPlaying
          ? const SizedBox.shrink()
          : const ColoredBox(
              color: Colors.black26,
              child: Center(
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 100.0,
                  semanticLabel: 'Play',
                ),
              ),
            ),
    );
  }
}
