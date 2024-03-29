import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_todo/view/auth/home_screen.dart';
import 'package:simple_todo/view/auth/phone_number_input_page.dart';
import 'package:simple_todo/view/profile_input_page.dart';
import 'package:simple_todo/view/signup_page.dart';
import 'package:simple_todo/view/auth/sms_code_input_page.dart';
import 'package:simple_todo/view/webview_page.dart';

final GoRouter myRouter = GoRouter(
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: HomeScreen(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: "webview",
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: MyWebviewPage(),
            );
          },
        ),
        GoRoute(
          path: "phone",
          pageBuilder: (context, state) {
            return MaterialPage(
              child: PhoneNumberInputPage(),
            );
          },
        ),
        GoRoute(
          path: "sms",
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SmsCodeIputPage(),
            );
          },
        ),
        GoRoute(
          path: "signup",
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SignUpPage(),
            );
          },
          routes: <GoRoute>[
            GoRoute(
              path: "input-profile",
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: ProfileInputPage(),
                );
              },
            ),
          ],
        ),
      ],
    )
  ],
);
