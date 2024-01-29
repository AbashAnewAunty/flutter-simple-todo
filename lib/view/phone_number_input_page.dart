import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_todo/view_model/auth_view_model.dart';

class PhoneNumberInputPage extends ConsumerWidget {
  const PhoneNumberInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authViewModelProvider);
    final _textEditingController = TextEditingController();
    final _focusNode = FocusNode();
    String _errorMessage = "";
    return Material(
      child: SafeArea(
        child: Focus(
          focusNode: _focusNode,
          child: GestureDetector(
            onTap: _focusNode.requestFocus,
            child: Scaffold(
              body: Column(children: [
                TextField(
                  controller: _textEditingController,
                  autofocus: false,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      // phoneNumber: '+81 8082 077 367',
                      phoneNumber: "+81${_textEditingController.text}",
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {
                        print(e.message);
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                content: Column(
                                  children: [
                                    Text(e.code),
                                    Text(e.message ?? "unknown error"),
                                  ],
                                ),
                              );
                            });
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        final authViewModel = ref.watch(authViewModelProvider.notifier);
                        authViewModel.verificationId = verificationId;
                        print(verificationId);
                        print(resendToken);
                        context.go("/sms");
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  child: Text("登録"),
                ),
                if (user != null) Text("uid: ${user.uid}"),
                if (user != null) Text("phoneNumber: ${user.phoneNumber}"),
                if (user != null) Text("providerId: ${user.providerData.first.providerId}"),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
