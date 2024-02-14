import 'package:simple_todo/data_model/my_user.dart';

abstract class FirebaseAuthManager {
  void saveVerificationId(String verificationId);
  Future<MyUser> signInWithSmsCode(String smsCode);
  Future<void> signOut();
}
