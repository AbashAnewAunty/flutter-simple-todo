import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AgreementPage extends StatelessWidget {
  const AgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 20),
      body: Center(
        child: Column(
          children: [
            const Text("Agreement"),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go("/agreement/turms");
              },
              child: const Text("turms"),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go("/agreement/privacy-policy");
              },
              child: const Text("privacy-policy"),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go("/signup");
              },
              child: const Text("signUp"),
            )
          ],
        ),
      ),
    );
  }
}
