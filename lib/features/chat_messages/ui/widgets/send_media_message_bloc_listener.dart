// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/networking/api_error_model.dart';
// import '../../../../core/theming/colors.dart';
// import '../../../../core/helpers/extensions.dart';
// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import '../../logic/send_media_message/send_media_message_cubit.dart';
// import '../../logic/send_media_message/send_media_message_state.dart';
//
// class SendMediaMessageBlocListener extends StatelessWidget {
//   const SendMediaMessageBlocListener({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<SendMediaMessageCubit, SendMediaMessageState>(
//       listenWhen: (previous, current) =>
//           current is SendMediaMessageLoading ||
//           current is SendMediaMessageSuccess ||
//           current is SendMediaMessageError,
//       listener: (context, state) {
//         state.whenOrNull(
//           sendMediaMessageLoading: () {
//             showDialog(
//               context: context,
//               builder: (context) => const Center(
//                 child: CircularProgressIndicator(
//                   color: ColorsManager.mainOrange,
//                 ),
//               ),
//             );
//           },
//           sendMediaMessageSuccess: (loginResponse) {
//             context.pop();
//           },
//           sendMediaMessageError: (apiErrorModel) {
//             setupErrorState(context, apiErrorModel);
//           },
//         );
//       },
//       child: const SizedBox.shrink(),
//     );
//   }
//
//   void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
//     final snackBar = SnackBar(
//       elevation: 0,
//       behavior: SnackBarBehavior.floating,
//       backgroundColor: Colors.transparent,
//       width: double.infinity,
//       content: AwesomeSnackbarContent(
//         title: 'Oops!',
//         message: apiErrorModel.getAllErrorMessages(),
//         contentType: ContentType.failure,
//       ),
//     );
//
//     ScaffoldMessenger.of(context)
//       ..hideCurrentSnackBar()
//       ..showSnackBar(snackBar);
//   }
// }
