import 'package:simple_todo/infrastracture/firebase_auth/firebase_auth_service.dart';
import 'package:simple_todo/domain/entity_notifier/my_user_notifer_provider.dart';
import 'package:simple_todo/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  late final FirebaseAuthService _firebaseAuthManager;
  late final MyUserNotifier _myUserNotifier;

  AuthRepositoryImpl(
    FirebaseAuthService firebaseAuthManager,
    MyUserNotifier myUserNotifier,
  ) {
    _firebaseAuthManager = firebaseAuthManager;
    _myUserNotifier = myUserNotifier;
  }

  @override
  void saveVeficationId(String verificationId) {
    _firebaseAuthManager.saveVerificationId(verificationId);
  }

  @override
  Future<void> signInWithSmsCode(String smsCode) async {
    final myUser = await _firebaseAuthManager.signInWithSmsCode(smsCode);
    _myUserNotifier.setMyUser(myUser);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuthManager.signOut();
  }
}
