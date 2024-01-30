import 'package:simple_todo/infrastracture/firebase/firebase_auth_manager.dart';
import 'package:simple_todo/provider/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  late final FirebaseAuthManager _firebaseAuthManager;

  AuthRepositoryImpl(FirebaseAuthManager firebaseAuthManager) {
    _firebaseAuthManager = firebaseAuthManager;
  }

  @override
  void saveVeficationId(String verificationId) {
    _firebaseAuthManager.saveVerificationId(verificationId);
  }

  @override
  Future<void> signInWithSmsCode(String smsCode) async {
    await _firebaseAuthManager.signInWithSmsCode(smsCode);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuthManager.signOut();
  }
}
