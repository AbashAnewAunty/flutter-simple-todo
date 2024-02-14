abstract class AuthRepository {
  void saveVeficationId(String verificationId);
  Future<void> signInWithSmsCode(String smsCode);
  Future<void> signOut();
}
