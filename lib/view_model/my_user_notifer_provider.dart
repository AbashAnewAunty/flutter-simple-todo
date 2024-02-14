import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/data_model/my_user.dart';

final myUserNotiferProvider = NotifierProvider<MyUserNotifier, MyUser>(() => MyUserNotifier());

class MyUserNotifier extends Notifier<MyUser> {
  @override
  MyUser build() {
    return const MyUser(uId: "");
  }

  setMyUser(MyUser myUser) {
    state = myUser;
  }
}
