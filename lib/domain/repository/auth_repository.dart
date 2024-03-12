import 'package:simple_todo/domain/entity/my_user.dart';

abstract class AuthRepository {
  Future<MyUser?> getCurrentUser();
  void saveVeficationId(String verificationId);
  Future<void> signInWithSmsCode(String smsCode);
  Future<void> signOut();
}
