import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_todo/domain/entity/my_todo.dart';
import 'package:simple_todo/infrastracture/firestore/firestore_service.dart';

class FireStoreServiceImpl extends FireStoreService {
  final _fireStore = FirebaseFirestore.instance;

  @override
  Future<List<MyTodo>> fetchMyTodos() async {
    _fireStore.collection("todos").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
    return [];
  }

  @override
  void addTodo(MyTodo myTodo) {
    final myTodoModel = <String, dynamic>{
      "id": myTodo.id,
      "title": myTodo.title,
      "detail": myTodo.detail,
      "createdAt": myTodo.createdAt,
    };

    _fireStore
        .collection("todos")
        .add(myTodoModel)
        .then((DocumentReference doc) => print('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
