import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/secure_storage_helper.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();

  runApp(EducatlyTask(appRouter: AppRouter()));
}

checkIfLoggedInUser() async {
  String userToken =
      await SecureStorageHelper.getSecuredString(SecureStorageKeys.accessToken);

  isLoggedInUser = userToken.isNotEmpty;
  log(isLoggedInUser
      ? "Logged-in user detected"
      : "No logged-in user detected");
}

class EducatlyTask extends StatelessWidget {
  final AppRouter appRouter;
  const EducatlyTask({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Educatly Task',
        theme: ThemeData.dark(),
        initialRoute:
            isLoggedInUser ? Routes.loginScreen : Routes.welcomeScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
