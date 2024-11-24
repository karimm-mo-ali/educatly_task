import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/helpers/extensions.dart';
import '../../logic/cubit/login/login_cubit.dart';
import '../../logic/cubit/login/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        state.whenOrNull(
          loginLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainOrange,
                ),
              ),
            );
          },
          loginSuccess: (loginResponse) {
            Navigator.of(context, rootNavigator: true).pop();
            //context.pushNamed(Routes.loginOtpScreen);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Login Successful! Welcome ${loginResponse.displayName}'),
              ),
            );
          },
          loginError: (errorModel) {
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
