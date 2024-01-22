import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                GoRouter.of(context).go("/login");
              },
              child: const Text("Login"),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go("/webview");
              },
              child: const Text("Webview"),
            )
          ],
        ),
      ),
    );
  }
}
