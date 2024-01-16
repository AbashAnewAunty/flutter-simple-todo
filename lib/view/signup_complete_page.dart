import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpCompletePage extends StatelessWidget {
  const SignUpCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 20),
      body: Center(
        child: Column(
          children: [
            const Text("SignUpComplete"),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go("/");
              },
              child: const Text("home"),
            )
          ],
        ),
      ),
    );
  }
}
