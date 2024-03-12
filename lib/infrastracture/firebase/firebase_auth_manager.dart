import 'package:simple_todo/domain/entity/my_user.dart';

abstract class FirebaseAuthManager {
  Future<MyUser?> getCurrentUser();
  void saveVerificationId(String verificationId);
  Future<MyUser> signInWithSmsCode(String smsCode);
  Future<void> signOut();
}
