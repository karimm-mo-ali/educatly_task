// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../logic/get_messages/messages_cubit.dart';
// import '../../logic/get_messages/messages_state.dart';
// import 'messages_list_view.dart';
// import 'messages_shimmer_loading.dart';
//
// class MessagesBlocBuilder extends StatelessWidget {
//   final String conversationId;
//   const MessagesBlocBuilder({super.key, required this.conversationId});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MessagesCubit, MessagesState>(
//       buildWhen: (previous, current) =>
//           current is MessagesLoading ||
//           current is MessagesSuccess ||
//           current is MessagesError,
//       builder: (context, state) {
//         return state.maybeWhen(
//             messagesLoading: () {
//               return Expanded(child: const MessagesListShimmerLoading());
//             },
//             messagesSuccess: (messagesDataList) {
//               final cubitState = context.watch<MessagesCubit>().state;
//               return MessagesListView(
//                 messagesList: messagesDataList ?? [],
//                 currentState: cubitState,
//                 conversationId: conversationId,
//               );
//             },
//             messagesError: (errorHandler) => Expanded(
//                   child: Center(
//                     child: Text(
//                       "Ooops.",
//                       style: TextStyle(fontSize: 16.sp, color: Colors.grey),
//                     ),
//                   ),
//                 ),
//             orElse: () {
//               return const SizedBox.shrink();
//             });
//       },
//     );
//   }
// }
