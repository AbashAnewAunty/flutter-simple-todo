import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, User?>(
  (ref) => AuthViewModel(initialUser: FirebaseAuth.instance.currentUser),
);

class AuthViewModel extends StateNotifier<User?> {
  AuthViewModel({User? initialUser}) : super(initialUser) {
    _auth.idTokenChanges().listen((user) {
      state = user;
    });
  }

  final _auth = FirebaseAuth.instance;
  String _verificationId = "";

  set verificationId(String value) {
    _verificationId = value;
  }

  Future<void> signInWithSmsCode(String smsCode) async {
    final credential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: smsCode);
    await _auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
