import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 20),
      body: const Center(
        child: Column(
          children: [
            Text("PrivacyPolicy"),
          ],
        ),
      ),
    );
  }
}
