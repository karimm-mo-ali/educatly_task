import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/signup/signup_cubit.dart';
import '../../logic/cubit/signup/signup_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupError,
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          signupSuccess: (signupResponse) {
            Navigator.of(context, rootNavigator: true).pop();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Signup Successful! Welcome ${signupResponse.displayName}'),
              ),
            );
          },
          signupError: (errorModel) {
            Navigator.of(context, rootNavigator: true).pop();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${errorModel.message}'),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
