import 'package:flutter/material.dart';
import 'package:simple_todo/view/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorSchemeSeed: Colors.pink,
        useMaterial3: true,
      ),
      routerConfig: myRouter,
      builder: (context, child) {
        return child!;
      },
    );
  }
}
