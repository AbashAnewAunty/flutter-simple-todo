import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:simple_todo/view_model/auth_view_model.dart';

class SmsCodeIputPage extends ConsumerWidget {
  const SmsCodeIputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authViewModelProvider);
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Column(children: [
            Pinput(
              length: 6,
              onCompleted: (String smsCode) async {
                final authViewModel = ref.watch(authViewModelProvider.notifier);
                await authViewModel.signInWithSmsCode(smsCode);
              },
            ),
            if (user != null) Text("uid: ${user.uid}"),
            if (user != null) Text("phoneNumber: ${user.phoneNumber}"),
            if (user != null) Text("providerId: ${user.providerData.first.providerId}"),
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
