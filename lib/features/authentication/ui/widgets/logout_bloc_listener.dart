// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:your_project_name/logic/cubits/logout_cubit.dart';
// import 'package:your_project_name/logic/states/logout_state.dart';
//
// class LogoutBlocListener extends StatelessWidget {
//   const LogoutBlocListener({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LogoutCubit, LogoutState>(
//       listenWhen: (previous, current) =>
//       current is LogoutLoading ||
//           current is LogoutSuccess ||
//           current is LogoutError,
//       listener: (context, state) {
//         state.whenOrNull(
//           logoutLoading: () {
//             showDialog(
//               context: context,
//               builder: (context) => const Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           },
//           logoutSuccess: () {
//             // Dismiss progress dialog
//             Navigator.of(context, rootNavigator: true).pop();
//
//             // Navigate to login or show success message
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Logout Successful!'),
//               ),
//             );
//           },
//           logoutError: (errorModel) {
//             // Dismiss progress dialog
//             Navigator.of(context, rootNavigator: true).pop();
//
//             // Show Snackbar with error message
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Error: ${errorModel.message}'),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           },
//         );
//       },
//       child: const SizedBox.shrink(),
//     );
//   }
// }
