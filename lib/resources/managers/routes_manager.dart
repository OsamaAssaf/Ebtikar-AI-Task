import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class Routes {
  static const String unDefinedRoute = '/NotFoundView';
  static const String splashRoute = '/SplashView';
  static const String navigationRoute = '/NavigationView';
  static const String homeRoute = '/HomeView';
  static const String connectionErrorRoute = '/ConnectionErrorView';
  static const String settingsRoute = '/SettingView';
  static const String profileRoute = '/ProfileView';
  static const String viewSingleVideoRoute = '/ViewSingleVideoView';
}

mixin RouteGenerator {
  static List<GetPage> getPages() {
    return <GetPage>[
      GetPage(
        name: Routes.splashRoute,
        page: () => SplashView(),
        binding: SplashBinding(),
      ),
      GetPage(
        name: Routes.navigationRoute,
        page: () => const NavigationView(),
        binding: NavigationBinding(),
      ),
      GetPage(
        name: Routes.homeRoute,
        page: () => HomeView(),
      ),
      GetPage(
        name: Routes.connectionErrorRoute,
        page: () => ConnectionErrorView(),
        binding: ConnectionErrorBinding(),
      ),
      GetPage(
        name: Routes.settingsRoute,
        page: () => SettingsView(),
        binding: SettingsBinding(),
      ),
      GetPage(
        name: Routes.profileRoute,
        page: () => ProfileView(),
        binding: ProfileBinding(),
      ),
      GetPage(
        name: Routes.viewSingleVideoRoute,
        page: () => ViewSingleVideoView(),
        binding: ViewSingleVideoBinding(),
      ),
    ];
  }

  static Scaffold unDefinedRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.noRouteFound),
      ),
      body: Center(
        child: Text(localizations.noRouteFound),
      ),
    );
  }
}
