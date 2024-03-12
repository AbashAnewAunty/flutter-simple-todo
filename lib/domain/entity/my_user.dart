import 'package:flutter/foundation.dart';

@immutable
class MyUser {
  final String uId;
  final String idToken;
  final String? phoneNumber;

  const MyUser({
    required this.uId,
    required this.idToken,
    this.phoneNumber,
  });

  MyUser copyWith({
    String? uId,
    String? idToken,
    String? phoneNumber,
  }) {
    return MyUser(
      uId: uId ?? this.uId,
      idToken: idToken ?? this.idToken,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
