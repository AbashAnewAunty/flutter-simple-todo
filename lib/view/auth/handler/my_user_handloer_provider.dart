import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/domain/repository/auth_repository.dart';
import 'package:simple_todo/repository/auth/auth_repository_provider.dart';
import 'package:simple_todo/view/auth/sms_code_input_view_model.dart';

final myUserHandlerProvider = Provider<MyUserHandler>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  final smsCodeInputViewModel = ref.read(smsCodeInputStateProvider.notifier);
  return MyUserHandler(
    authRepository,
    smsCodeInputViewModel,
  );
});

class MyUserHandler {
  late final AuthRepository _authRepository;
  late final SmsCodeInputViewModel _smsCodeInputViewModel;

  MyUserHandler(
    AuthRepository authRepository,
    SmsCodeInputViewModel smsCodeInputViewModel,
  ) {
    _authRepository = authRepository;
    _smsCodeInputViewModel = smsCodeInputViewModel;
  }

  void saveVeficationId(String verificationId) {
    _authRepository.saveVeficationId(verificationId);
  }

  Future<void> signInWithSmsCode(String smsCode) async {
    _smsCodeInputViewModel.setLoadingState(true);
    await _authRepository.signInWithSmsCode(smsCode);
    _smsCodeInputViewModel.setLoadingState(false);
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
