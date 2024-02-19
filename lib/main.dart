import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/firebase_options.dart';
import 'package:simple_todo/view/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        theme: ThemeData(
          colorSchemeSeed: Colors.pink,
          useMaterial3: true,
        ),
        routerConfig: myRouter,
        builder: (context, child) {
          return child!;
        },
      ),
    );
  }
}
