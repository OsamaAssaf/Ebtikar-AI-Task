import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SharedPrefsService {
  SharedPrefsService._();

  static final SharedPrefsService _instance = SharedPrefsService._();

  factory SharedPrefsService() => _instance;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setLanguage(String value) async {
    await sharedPreferences.setString(DotenvManager.languagePrefsKey, value);
  }

  String? getLanguage() {
    return sharedPreferences.getString(DotenvManager.languagePrefsKey);
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    await sharedPreferences.setString(
      DotenvManager.themeModePrefsKey,
      themeMode == ThemeMode.dark
          ? ThemeMode.dark.toString()
          : themeMode == ThemeMode.light
              ? ThemeMode.light.toString()
              : ThemeMode.system.toString(),
    );
  }

  ThemeMode getThemeMode() {
    final String? mode = sharedPreferences.getString(DotenvManager.themeModePrefsKey);
    return mode == ThemeMode.dark.toString()
        ? ThemeMode.dark
        : mode == ThemeMode.light.toString()
            ? ThemeMode.light
            : ThemeMode.system;
  }

  Future<void> saveSavedVideos(VideoModel videoModel) async {
    final List<VideoModel> result = getSavedVideos();
    if (result.contains(videoModel)) return;
    result.add(videoModel);
    final List<String> list = [];
    for (final VideoModel video in result) {
      list.add(jsonEncode(video.toJson()));
    }
    if (list.isNotEmpty) {
      await sharedPreferences.setStringList(DotenvManager.savedVideosPrefsKey, list);
    }
  }

  List<VideoModel> getSavedVideos() {
    final List<String>? list = sharedPreferences.getStringList(DotenvManager.savedVideosPrefsKey);
    if (list == null) return [];
    final List<VideoModel> result = [];
    for (final String item in list) {
      result.add(VideoModel.fromJson(jsonDecode(item)));
    }
    return result;
  }

  Future<void> clearSavedVideos() async {
    await sharedPreferences.remove(DotenvManager.savedVideosPrefsKey);
  }
}
