import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_todo/domain/entity/my_todo.dart';
import 'package:simple_todo/infrastracture/firestore/firestore_service_provider.dart';
import 'package:simple_todo/view/auth/handler/my_user_handloer_provider.dart';
import 'package:simple_todo/domain/entity_notifier/my_user_notifer_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserNotiferProvider);
    final myUserHandler = ref.read(myUserHandlerProvider);
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
            if (myUser.uId.isNotEmpty) Text("uid: ${myUser.uId}"),
            if (myUser.uId.isNotEmpty)
              ElevatedButton(
                onPressed: () async {
                  await myUserHandler.signOut();
                },
                child: const Text("sign out"),
              ),
            ElevatedButton(
              onPressed: () async {
                final firestoreService = ref.read(firestoreServiceProvider);
                final myTodo = MyTodo(
                  id: "12345",
                  title: "hello",
                  detail: "Cloud Firestore",
                  createdAt: DateTime.now(),
                );
                firestoreService.addTodo(myTodo);
              },
              child: const Text("add todo to firestore"),
            ),
            ElevatedButton(
              onPressed: () async {
                final firestoreService = ref.read(firestoreServiceProvider);
                await firestoreService.fetchMyTodos();
              },
              child: const Text("fetch todos"),
            ),
          ],
        ),
      ),
    );
  }
}
