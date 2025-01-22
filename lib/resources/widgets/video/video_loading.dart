import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class VideoLoading extends StatelessWidget {
  const VideoLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: customTheme.grey,
      highlightColor: customTheme.lightGrey,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: customTheme.grey,
      ),
    );
  }
}
