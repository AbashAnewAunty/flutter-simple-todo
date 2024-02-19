import 'package:flutter/foundation.dart';

@immutable
class MyTodo {
  final String id;
  final String title;
  final String detail;
  final DateTime? createdAt;

  const MyTodo({required this.id, this.title = "", this.detail = "", this.createdAt});

  MyTodo copyWith({
    String? id,
    String? title,
    String? detail,
    DateTime? createdAt,
  }) {
    return MyTodo(
      id: id ?? this.id,
      title: title ?? this.title,
      detail: detail ?? this.detail,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
