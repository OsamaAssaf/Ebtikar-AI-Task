import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class AuthFake extends AuthRepository {
  @override
  Future<UserModel> login() async {
    return UserModel(
      id: 1,
      fullName: 'Name',
      email: 'email@gmail.com',
    );
  }
}
