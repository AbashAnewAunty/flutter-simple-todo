import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_todo/view_model/auth_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authViewModelProvider);
    final authController = ref.watch(authViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("Home"),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go("/phone");
              },
              child: const Text("新規会員登録"),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go("/phone");
              },
              child: const Text("Login"),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go("/webview");
              },
              child: const Text("Webview"),
            ),
            if (user != null) Text("uid: ${user.uid}"),
            if (user != null) Text("phoneNumber: ${user.phoneNumber}"),
            if (user != null) Text("providerId: ${user.providerData.first.providerId}"),
            if (user != null)
              ElevatedButton(
                onPressed: () async {
                  await authController.signOut();
                },
                child: const Text("sign out"),
              ),
          ],
        ),
      ),
    );
  }
}
