import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_todo/infrastracture/firebase/firebase_auth_manager.dart';

class FirebaseAuthManagerImpl implements FirebaseAuthManager {
  final _auth = FirebaseAuth.instance;
  String _verificationId = "";

  FirebaseAuthManagerImpl();

  @override
  void saveVerificationId(String verificationId) {
    _verificationId = verificationId;
  }

  @override
  Future<void> signInWithSmsCode(String smsCode) async {
    final credential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: smsCode);
    await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
