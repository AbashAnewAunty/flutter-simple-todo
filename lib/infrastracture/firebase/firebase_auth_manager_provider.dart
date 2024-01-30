import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/infrastracture/firebase/firebase_auth_manager.dart';
import 'package:simple_todo/infrastracture/firebase/firebase_auth_manager_impl.dart';

final firebaseAuthManagerProvider = Provider<FirebaseAuthManager>((ref) => FirebaseAuthManagerImpl());
