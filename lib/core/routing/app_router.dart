import 'package:flutter/material.dart';
import '../../features/authentication/ui/login_screen.dart';
import '../../features/authentication/ui/signup_screen.dart';
import '../../features/welcome/welcome_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );

      // case Routes.surveyNotesScreen:
      //   if (arguments is Map<String, dynamic>) {
      //     final surveyId = arguments['surveyId'] as String? ?? '';
      //     return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //         create: (context) =>
      //             AllNotesCubit(getIt())..getAllNotes(surveyId: surveyId),
      //         child: SurveyNotesScreen(surveyId: surveyId),
      //       ),
      //     );
      //   }
      //   return _errorRoute();
      //
      // case Routes.chatMessagesScreen:
      //   if (arguments is Map<String, dynamic>) {
      //     final conversationId = arguments['conversationId'] as String? ?? '';
      //     final usersChatList =
      //         arguments['usersChatList'] as List<Users?>? ?? [];
      //     return MaterialPageRoute(
      //       builder: (_) => MultiBlocProvider(
      //         providers: [
      //           BlocProvider(
      //             create: (context) =>
      //                 MessagesCubit(getIt<ChatMessagesRepo>(), conversationId)
      //                   ..getMessages(conversationId: conversationId),
      //           ),
      //           BlocProvider(
      //             create: (context) => getIt<OnlineUsersCubit>(),
      //           ),
      //           BlocProvider(
      //             create: (context) => getIt<SendMediaMessageCubit>(),
      //           ),
      //         ],
      //         child: ChatMessagesScreen(
      //           conversationId: conversationId,
      //           usersChatList: usersChatList,
      //         ),
      //       ),
      //     );
      //   }
      //   return _errorRoute();

      default:
        return null;
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error: Route not found!'),
        ),
      ),
    );
  }
}
