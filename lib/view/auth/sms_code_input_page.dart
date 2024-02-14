import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:simple_todo/view/auth/handler/my_user_handloer_provider.dart';
import 'package:simple_todo/domain/my_user_notifer_provider.dart';

class SmsCodeIputPage extends ConsumerWidget {
  const SmsCodeIputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserNotiferProvider);
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Column(children: [
            Pinput(
              length: 6,
              onCompleted: (String smsCode) async {
                final myUserHandler = ref.read(myUserHandlerProvider);
                await myUserHandler.signInWithSmsCode(smsCode);
              },
            ),
            if (myUser.uId.isNotEmpty) Text("uid: ${myUser.uId}"),
            ElevatedButton(
              onPressed: () {
                context.go("/");
              },
              child: const Text("Home"),
            ),
          ]),
        ),
      ),
    );
  }
}
