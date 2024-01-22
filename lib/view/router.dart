import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_todo/view/agreement_dart.dart';
import 'package:simple_todo/view/code_input_page.dart';
import 'package:simple_todo/view/home_screen.dart';
import 'package:simple_todo/view/login_page.dart';
import 'package:simple_todo/view/privacy_policy_page.dart';
import 'package:simple_todo/view/profile_input_page.dart';
import 'package:simple_todo/view/signup_complete_page.dart';
import 'package:simple_todo/view/signup_page.dart';
import 'package:simple_todo/view/turms_page.dart';
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
          path: "login",
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: LoginPage(),
            );
          },
        ),
        GoRoute(
          path: "agreement",
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: AgreementPage(),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: "turms",
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: TurmsPage(),
                );
              },
            ),
            GoRoute(
              path: "privacy-policy",
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: PrivacyPolicyPage(),
                );
              },
            ),
          ],
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
            GoRoute(
              path: "input-code",
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: CodeInputPage(),
                );
              },
            ),
            GoRoute(
              path: "complete",
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: SignUpCompletePage(),
                );
              },
            ),
          ],
        ),
      ],
    )
  ],
);
