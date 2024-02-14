import 'package:flutter/foundation.dart';

@immutable
class MyUser {
  final String uId;
  final String? phoneNumber;

  const MyUser({
    required this.uId,
    this.phoneNumber,
  });

  MyUser copyWith({
    String? uId,
    String? phoneNumber,
  }) {
    return MyUser(
      uId: uId ?? this.uId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
