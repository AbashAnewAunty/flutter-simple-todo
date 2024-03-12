import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/domain/entity/my_user.dart';

final smsCodeInputStateProvider = NotifierProvider<SmsCodeInputViewModel, SmsCodeInputState>(
  () => SmsCodeInputViewModel(),
);

class SmsCodeInputState {
  final bool isLoading;
  final MyUser myUser;

  SmsCodeInputState({
    this.isLoading = false,
    required this.myUser,
  });

  SmsCodeInputState copyWith({
    bool? isLoading,
    MyUser? myUser,
  }) {
    return SmsCodeInputState(
      isLoading: isLoading ?? this.isLoading,
      myUser: myUser ?? this.myUser,
    );
  }
}

class SmsCodeInputViewModel extends Notifier<SmsCodeInputState> {
  @override
  SmsCodeInputState build() {
    return SmsCodeInputState(
      myUser: const MyUser(
        uId: "",
        idToken: "",
      ),
    );
  }

  void setLoadingState(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setMyUser(MyUser myUser) {
    state = state.copyWith(myUser: myUser);
  }
}
