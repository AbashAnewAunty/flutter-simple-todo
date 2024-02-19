import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/infrastracture/firebase_auth/firebase_auth_service.dart';
import 'package:simple_todo/infrastracture/firebase_auth/firebase_auth_service_impl.dart';

final firebaseAuthServiceProvider = Provider<FirebaseAuthService>((ref) => FirebaseAuthServiceImpl());
