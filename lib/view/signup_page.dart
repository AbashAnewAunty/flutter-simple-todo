import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 20),
      body: Center(
        child: Column(
          children: [
            const Text("SignUp"),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go("/signup/input-profile");
              },
              child: const Text("ProfileInput"),
            )
          ],
        ),
      ),
    );
  }
}
