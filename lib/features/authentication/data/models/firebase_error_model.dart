import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorModel {
  final String message;
  final String? code;

  FirebaseErrorModel({
    required this.message,
    this.code,
  });

  static FirebaseErrorModel fromFirebaseException(Exception exception) {
    String message = "An unexpected error occurred";
    String? code;

    if (exception is FirebaseAuthException) {
      message = exception.message ?? "Authentication error";
      code = exception.code;
    } else if (exception is FirebaseException) {
      message = exception.message ?? "Firebase error";
      code = exception.code;
    } else {
      message = exception.toString();
    }

    return FirebaseErrorModel(message: message, code: code);
  }
}
