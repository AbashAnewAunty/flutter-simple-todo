import 'package:simple_todo/infrastracture/firebase/firebase_auth_manager.dart';
import 'package:simple_todo/provider/auth_repository.dart';
import 'package:simple_todo/view_model/my_user_notifer_provider.dart';

class AuthRepositoryImpl implements AuthRepository {
  late final FirebaseAuthManager _firebaseAuthManager;
  late final MyUserNotifier _myUserNotifier;

  AuthRepositoryImpl(
    FirebaseAuthManager firebaseAuthManager,
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
