import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_todo/domain/entity/my_user.dart';
import 'package:simple_todo/infrastracture/firebase_auth/firebase_auth_service.dart';

class FirebaseAuthServiceImpl implements FirebaseAuthService {
  final _auth = FirebaseAuth.instance;
  String _verificationId = "";

  FirebaseAuthServiceImpl();

  @override
  void saveVerificationId(String verificationId) {
    _verificationId = verificationId;
  }

  @override
  Future<MyUser> signInWithSmsCode(String smsCode) async {
    final credential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: smsCode);
    final firebaseUser = await _auth.signInWithCredential(credential);
    if (firebaseUser.user == null) {
      throw Error();
    }
    return MyUser(uId: firebaseUser.user!.uid);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
