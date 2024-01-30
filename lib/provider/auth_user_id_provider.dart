import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userIdProvider = StateNotifierProvider<UserIdValue, String?>(
  (ref) => UserIdValue(initialUserId: FirebaseAuth.instance.currentUser?.uid ?? ""),
);

class UserIdValue extends StateNotifier<String?> {
  UserIdValue({String? initialUserId}) : super(initialUserId) {
    _auth.idTokenChanges().listen((user) {
      state = user?.uid ?? "";
    });
  }

  final _auth = FirebaseAuth.instance;
}
