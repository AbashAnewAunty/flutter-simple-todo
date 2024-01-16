import 'package:flutter/material.dart';

class TurmsPage extends StatelessWidget {
  const TurmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 20),
      body: const Center(
        child: Column(
          children: [
            Text("Turms"),
          ],
        ),
      ),
    );
  }
}
