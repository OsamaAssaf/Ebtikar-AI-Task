import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: width * 0.50,
            maxHeight: width * 0.50,
          ),
          child: Image.asset(
            IconsManager.appLogo,
          ),
        ),
      ),
    );
  }
}
