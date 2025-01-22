import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveDesign(
      mobile: Scaffold(
        body: const Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
