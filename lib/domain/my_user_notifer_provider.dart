import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/domain/entity/my_user.dart';

final myUserNotiferProvider = NotifierProvider<MyUserNotifier, MyUser>(() => MyUserNotifier());

class MyUserNotifier extends Notifier<MyUser> {
  @override
  MyUser build() {
    return const MyUser(
      uId: "",
      idToken: "",
    );
  }

  setMyUser(MyUser myUser) {
    state = myUser;
  }
}
