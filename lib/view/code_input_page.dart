import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CodeInputPage extends StatelessWidget {
  const CodeInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 20),
      body: Center(
        child: Column(
          children: [
            const Text("CodeIput"),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go("/signup/complete");
              },
              child: const Text("complete"),
            )
          ],
        ),
      ),
    );
  }
}
