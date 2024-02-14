import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/domain/repository/auth_repository.dart';
import 'package:simple_todo/repository/auth/auth_repository_provider.dart';

final myUserHandlerProvider = Provider<MyUserHandler>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return MyUserHandler(authRepository);
});

class MyUserHandler {
  late final AuthRepository _authRepository;

  MyUserHandler(AuthRepository authRepository) {
    _authRepository = authRepository;
  }

  void saveVeficationId(String verificationId) {
    _authRepository.saveVeficationId(verificationId);
  }

  Future<void> signInWithSmsCode(String smsCode) async {
    await _authRepository.signInWithSmsCode(smsCode);
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
