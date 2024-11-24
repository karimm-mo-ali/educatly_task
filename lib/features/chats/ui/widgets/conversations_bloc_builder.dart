// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../logic/cubit/conversations_cubit.dart';
// import '../../logic/cubit/conversations_state.dart';
// import 'conversation_list_view.dart';
// import 'conversation_shimmer_loading.dart';
//
// class ConversationsBlocBuilder extends StatelessWidget {
//   const ConversationsBlocBuilder({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ConversationsCubit, ConversationsState>(
//       buildWhen: (previous, current) =>
//           current is ConversationsLoading ||
//           current is ConversationsSuccess ||
//           current is ConversationsError,
//       builder: (context, state) {
//         return state.maybeWhen(
//           conversationsLoading: () {
//             return const ConversationShimmerLoading();
//           },
//           conversationsSuccess: (conversationsDataList) {
//             final cubitState = context.watch<ConversationsCubit>().state;
//             return ConversationListView(
//               conversationsList: conversationsDataList ?? [],
//               currentState: cubitState,
//             );
//           },
//           conversationsError: (errorHandler) => Expanded(
//             child: Center(
//               child: Text(
//                 "Ooops.",
//                 style: TextStyle(fontSize: 16.sp, color: Colors.grey),
//               ),
//             ),
//           ),
//           orElse: () {
//             return const SizedBox.shrink();
//           },
//         );
//       },
//     );
//   }
// }
