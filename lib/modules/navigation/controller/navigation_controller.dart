import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class NavigationController extends GetxController {
  final List<NavItemModel> navScreens = [
    NavItemModel(
      title: localizations.home,
      icon: Icons.home_outlined,
      view: HomeView(),
    ),
    NavItemModel(
      title: localizations.search,
      icon: Icons.search_outlined,
      view: SearchView(),
    ),
    NavItemModel(
      title: localizations.savedVideos,
      icon: Icons.star_border_outlined,
      view: SavedVideosView(),
    ),
    NavItemModel(
      title: localizations.profile,
      icon: Icons.perm_identity_rounded,
      view: ProfileView(),
    ),
  ];

  int selectedNavIndex = 0;
  void changeIndex(int value) {
    selectedNavIndex = value;
    update();
  }

  Widget getPage() {
    return navScreens.elementAt(selectedNavIndex).view;
  }
}
