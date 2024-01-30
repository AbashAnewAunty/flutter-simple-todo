abstract class FirebaseAuthManager {
  void saveVerificationId(String verificationId);
  Future<void> signInWithSmsCode(String smsCode);
  Future<void> signOut();
}
