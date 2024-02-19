import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/domain/entity_notifier/my_user_notifer_provider.dart';
import 'package:simple_todo/view/auth/sms_code_input_view_model.dart';

final smsCodeInputModelProvider = Provider((ref) {
  final myUser = ref.watch(myUserNotiferProvider);
  final smsCodeState = ref.watch(smsCodeInputStateProvider);
  return SmsCodeInputState(
    myUser: myUser,
    isLoading: smsCodeState.isLoading,
  );
});
