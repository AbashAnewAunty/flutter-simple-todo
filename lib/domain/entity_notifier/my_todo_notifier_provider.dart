import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/domain/entity/my_todo.dart';

class MyTodosNotifier extends Notifier<List<MyTodo>> {
  @override
  List<MyTodo> build() {
    return [];
  }

  void addMyTodo(MyTodo myTodo) {
    state = [...state, myTodo];
  }

  void removeMyTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}
