import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/firebase_error_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repos/auth_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState<UserModel>> {
  final AuthRepository _authRepository;

  SignupCubit(this._authRepository) : super(const SignupState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      emit(const SignupState.signupLoading());
      UserModel? user = await _authRepository.login(
          emailController.text, passController.text);
      if (user != null) {
        emit(SignupState.signupSuccess(user));
      }
    } catch (e) {
      FirebaseErrorModel error =
          FirebaseErrorModel.fromFirebaseException(e as Exception);
      emit(SignupState.signupError(error));
    }
  }
}
