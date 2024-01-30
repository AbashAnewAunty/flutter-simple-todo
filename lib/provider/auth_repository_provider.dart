import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/infrastracture/firebase/firebase_auth_manager_provider.dart';
import 'package:simple_todo/provider/auth_repository.dart';
import 'package:simple_todo/provider/auth_repository_impl.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final firebaseAuthManager = ref.read(firebaseAuthManagerProvider);
  return AuthRepositoryImpl(firebaseAuthManager);
});
