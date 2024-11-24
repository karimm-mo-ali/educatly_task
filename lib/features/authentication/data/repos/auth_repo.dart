import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/secure_storage_helper.dart';
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign up user with email and password
  Future<UserModel?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = UserModel.fromFirebaseUser(userCredential.user!);
      return user;
    } catch (e) {
      throw Exception('Sign Up Failed: ${e.toString()}');
    }
  }

  // Login user with email and password
  Future<UserModel?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = UserModel.fromFirebaseUser(userCredential.user!);
      await SecureStorageHelper.setSecuredString(SecureStorageKeys.accessToken, userCredential.user!.uid);
      await SecureStorageHelper.setSecuredString(SecureStorageKeys.userId, user.uid);
      return user;
    } catch (e) {
      throw Exception('Login Failed: ${e.toString()}');
    }
  }

  // Logout user
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      await SecureStorageHelper.clearAllSecuredData();
    } catch (e) {
      throw Exception('Logout Failed: ${e.toString()}');
    }
  }

  // Get the current user from Firebase
  Future<UserModel?> getCurrentUser() async {
    try {
      User? firebaseUser = _firebaseAuth.currentUser;
      if (firebaseUser != null) {
        return UserModel.fromFirebaseUser(firebaseUser);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get current user: ${e.toString()}');
    }
  }
}
