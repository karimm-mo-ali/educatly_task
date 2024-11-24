import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/firebase_error_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repos/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState<UserModel>> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      emit(const LoginState.loginLoading());
      UserModel? user = await _authRepository.login(
          emailController.text, passController.text);
      if (user != null) {
        emit(LoginState.loginSuccess(user));
      }
    } catch (e) {
      FirebaseErrorModel error =
          FirebaseErrorModel.fromFirebaseException(e as Exception);
      emit(LoginState.loginError(error));
    }
  }
}
