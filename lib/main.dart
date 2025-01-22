import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

late AppLocalizations localizations;
late ThemeData theme;
late CustomThemeData customTheme;
late SharedPreferences sharedPreferences;
late PackageInfo packageInfo;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait(
    [
      dotenv.load(),
      SharedPrefsService().init(),
      MasterFunctionsService().initPackageInfo(),
      MasterFunctionsService().initPreferredOrientations(),
    ],
  );
  MasterFunctionsService().initSystemUiStyle();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) {
        localizations = AppLocalizations.of(context)!;
        return localizations.appName;
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: languageController.getLocale(),
      theme: ThemeManager.getLightTheme(),
      themeMode: SharedPrefsService().getThemeMode(),
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      builder: (BuildContext context, Widget? child) {
        theme = Theme.of(context);
        customTheme = theme.extension<CustomThemeData>()!;
        languageController.initLanguageList();
        return LoadingPlus(
          loadingWidget: Components().customLoadingItem(),
          child: child!,
        );
      },
      initialRoute: Routes.splashRoute,
      getPages: RouteGenerator.getPages(),
      unknownRoute: GetPage(
        name: Routes.unDefinedRoute,
        page: () => RouteGenerator.unDefinedRoute(),
      ),
    );
  }
}
