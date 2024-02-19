import 'package:simple_todo/domain/entity/my_todo.dart';

abstract class FireStoreService {
  void addTodo(MyTodo myTodo);
  Future<List<MyTodo>> fetchMyTodos();
}
