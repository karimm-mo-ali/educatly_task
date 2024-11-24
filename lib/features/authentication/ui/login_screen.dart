import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/app_regex.dart';
import '../logic/cubit/login/login_cubit.dart';
import 'widgets/input_text_field.dart';
import 'widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: context.read<LoginCubit>().formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeInUp(
                            duration: const Duration(milliseconds: 1000),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeInUp(
                            duration: const Duration(milliseconds: 1200),
                            child: Text(
                              "Login to your account",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          FadeInUp(
                            duration: const Duration(milliseconds: 1200),
                            child: InputTextField(
                              label: "Email",
                              controller:
                                  context.read<LoginCubit>().emailController,
                              hintText: "Enter your email",
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email cannot be empty";
                                }
                                if (!AppRegex.isEmailValid(value)) {
                                  return "Enter a valid email address";
                                }
                                return null;
                              },
                            ),
                          ),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1300),
                            child: InputTextField(
                              label: "Password",
                              controller:
                                  context.read<LoginCubit>().passController,
                              hintText: "Enter your password",
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password cannot be empty";
                                }
                                if (!AppRegex.isPasswordValid(value)) {
                                  return "Password must contain:\n"
                                      "- At least 8 characters\n"
                                      "- At least one uppercase letter\n"
                                      "- At least one lowercase letter\n"
                                      "- At least one digit\n"
                                      "- At least one special character";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeInUp(
                        duration: const Duration(milliseconds: 1400),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            padding: const EdgeInsets.only(top: 3, left: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: const Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (context
                                    .read<LoginCubit>()
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  context.read<LoginCubit>().login();
                                }
                              },
                              color: Colors.greenAccent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                            ),
                          ),
                        )),
                    FadeInUp(
                        duration: const Duration(milliseconds: 1500),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have an account?"),
                            Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              FadeInUp(
                duration: const Duration(milliseconds: 1200),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              const LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
