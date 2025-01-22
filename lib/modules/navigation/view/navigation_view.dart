import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (controller) {
        return Scaffold(
          body: controller.getPage(),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: customTheme.secondaryBackground,
            selectedItemColor: theme.colorScheme.primary,
            unselectedItemColor: theme.colorScheme.surface,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              controller.changeIndex(index);
            },
            items: controller.navScreens.map<BottomNavigationBarItem>(
              (NavItemModel item) {
                return BottomNavigationBarItem(
                  icon: Icon(
                    item.icon,
                  ),
                  label: item.title,
                );
              },
            ).toList(),
            currentIndex: controller.selectedNavIndex,
          ),
        );
      },
    );
  }
}
