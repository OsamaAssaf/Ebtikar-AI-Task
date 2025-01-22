import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class ConstantsManager {
  static const double appbarHeight = 50.0;
}

mixin DotenvManager {
  static final String languagePrefsKey = dotenv.env['LANGUAGE_PREFS_KEY']!;
  static final String themeModePrefsKey = dotenv.env['THEME_MODE_PREFS_KEY']!;
  static final String savedVideosPrefsKey = dotenv.env['SAVED_VIDEOS_PREFS_KEY']!;
  static final String userModelPrefsKey = dotenv.env['USER_MODEL_TIME_PREFS_KEY']!;

  static final String baseUrl = dotenv.env['BASE_URL']!;
  static final String getVideosEndpoint = dotenv.env['GET_VIDEOS_ENDPOINT']!;
}
