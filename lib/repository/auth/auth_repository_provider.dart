import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/infrastracture/firebase_auth/firebase_auth_service_provider.dart';
import 'package:simple_todo/domain/repository/auth_repository.dart';
import 'package:simple_todo/repository/auth/auth_repository_impl.dart';

import 'package:simple_todo/domain/entity_notifier/my_user_notifer_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final firebaseAuthManager = ref.read(firebaseAuthServiceProvider);
  final myUserNotifier = ref.read(myUserNotiferProvider.notifier);
  return AuthRepositoryImpl(firebaseAuthManager, myUserNotifier);
});
