import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

abstract class AuthRepository {
  Future<UserModel> login();
}
