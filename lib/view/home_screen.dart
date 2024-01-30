import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_todo/provider/auth_repository_provider.dart';
import 'package:simple_todo/provider/auth_user_id_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userIdProvider);
    final authProvider = ref.read(authRepositoryProvider);
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
            if (userId != null && userId.isNotEmpty) Text("uid: $userId"),
            if (userId != null && userId.isNotEmpty)
              ElevatedButton(
                onPressed: () async {
                  await authProvider.signOut();
                },
                child: const Text("sign out"),
              ),
          ],
        ),
      ),
    );
  }
}
