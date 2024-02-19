import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/infrastracture/firestore/firestore_service.dart';
import 'package:simple_todo/infrastracture/firestore/firestore_service_impl.dart';

final firestoreServiceProvider = Provider<FireStoreService>((ref) => FireStoreServiceImpl());
