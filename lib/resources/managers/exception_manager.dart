import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class ExceptionManager {
  ExceptionManager._();

  static final ExceptionManager _instance = ExceptionManager._();

  factory ExceptionManager() => _instance;

  Duration timedOutDuration = const Duration(seconds: 15);
  static String unknownException = 'unknown';
  static String timedOutException = 'timedOut';

  void showException([String? error]) {
    String? errorMessage = error;
    if (error == timedOutException) {
      errorMessage = localizations.serverNotReachable;
    }
    if (error == unknownException) {
      errorMessage = localizations.somethingWrongTryAgain;
    }

    Components().snackBar(
      message: errorMessage ?? localizations.somethingWrongTryAgain,
      snackBarStatus: SnackBarStatus.error,
    );
  }

  void checkExceptions(int statusCode, dynamic body) {
    if (statusCode == 408) throw timedOutException;
    if (statusCode != 200) {
      final String? error = body;
      throw error ?? localizations.somethingWrongTryAgain;
    }
  }
}
