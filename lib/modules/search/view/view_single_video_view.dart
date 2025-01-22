import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class ViewSingleVideoView extends GetView<ViewSingleVideoController> {
  const ViewSingleVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: '${controller.videoModel.title}',
        canBack: true,
      ),
      body: VideoItem(
        videoModel: controller.videoModel,
      ),
    );
  }
}
