import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:simple_todo/provider/auth_repository_provider.dart';
import 'package:simple_todo/provider/auth_user_id_provider.dart';

class SmsCodeIputPage extends ConsumerWidget {
  const SmsCodeIputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userIdProvider);
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Column(children: [
            Pinput(
              length: 6,
              onCompleted: (String smsCode) async {
                final authRepository = ref.read(authRepositoryProvider);
                await authRepository.signInWithSmsCode(smsCode);
              },
            ),
            if (userId != null && userId.isNotEmpty) Text("uid: $userId"),
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
