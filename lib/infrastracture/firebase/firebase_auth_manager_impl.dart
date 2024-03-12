import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_todo/domain/entity/my_user.dart';
import 'package:simple_todo/infrastracture/firebase/firebase_auth_manager.dart';

class FirebaseAuthManagerImpl implements FirebaseAuthManager {
  final _auth = FirebaseAuth.instance;
  String _verificationId = "";

  FirebaseAuthManagerImpl();

  @override
  Future<MyUser?> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user == null) {
      return null;
    }

    final idToken = await user.getIdToken();

    final myUser = MyUser(
      uId: user.uid,
      idToken: idToken!,
      phoneNumber: user.phoneNumber!,
    );
    return myUser;
  }

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
    final idToken = await firebaseUser.user!.getIdToken();
    print("idToken: $idToken");
    return MyUser(uId: firebaseUser.user!.uid, idToken: idToken!);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
