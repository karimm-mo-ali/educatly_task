// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../../core/helpers/constants.dart';
// import '../../../../core/helpers/secure_storage_helper.dart';
// import '../../../../core/helpers/spacing.dart';
// import '../../../../core/theming/font_weight_helper.dart';
// import '../../../../core/widgets/cached_network_image.dart';
// import '../../data/models/get_messages/messages_response.dart';
// import '../../logic/get_messages/messages_cubit.dart';
// import '../../logic/get_messages/messages_state.dart';
// import 'package:timeago/timeago.dart' as timeago;
//
// import 'messages_shimmer_loading.dart';
//
// class MessagesListView extends StatefulWidget {
//   final List<Messages?> messagesList;
//   final MessagesState currentState;
//   final String conversationId;
//   const MessagesListView(
//       {super.key,
//       required this.messagesList,
//       required this.currentState,
//       required this.conversationId});
//
//   @override
//   State<MessagesListView> createState() => _MessagesListViewState();
// }
//
// class _MessagesListViewState extends State<MessagesListView> {
//   final ScrollController _scrollController = ScrollController();
//   final bool _isAtBottom = true;
//   String? userId;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserId();
//     _scrollController.addListener(() {
//       final position = _scrollController.position;
//       if (position.pixels == position.maxScrollExtent) {
//         context.read<MessagesCubit>().loadMoreMessages(widget.conversationId);
//       }
//     });
//   }
//
//   void _scrollToBottom() {
//     _scrollController.animateTo(
//       _scrollController.position.minScrollExtent,
//       duration: const Duration(milliseconds: 150),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   Future<void> _fetchUserId() async {
//     String fetchedUserId =
//         await SecureStorageHelper.getSecuredString(SharedPrefKeys.userId);
//     setState(() {
//       userId = fetchedUserId;
//     });
//     print("userId is $userId");
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<MessagesCubit>();
//     return widget.messagesList.isEmpty
//         ? Expanded(
//             child: Center(
//               child: Text(
//                 "No messages available.",
//                 style: TextStyle(fontSize: 16.sp, color: Colors.grey),
//               ),
//             ),
//           )
//         : Expanded(
//             child: Stack(
//               children: [
//                 ValueListenableBuilder<DateTime>(
//                   valueListenable: cubit.timeNotifier,
//                   builder: (context, currentTime, _) {
//                     return ListView.builder(
//                       controller: _scrollController,
//                       padding: EdgeInsets.only(
//                         top: MediaQuery.of(context).padding.top + 100,
//                       ),
//                       reverse: true,
//                       shrinkWrap: true,
//                       itemCount: widget.messagesList.length +
//                           (widget.currentState is MessagesLoadingMore ? 1 : 0),
//                       itemBuilder: (context, index) {
//                         if (index == widget.messagesList.length) {
//                           return widget.currentState is MessagesLoadingMore
//                               ? const MessagesListShimmerLoading()
//                               : const SizedBox.shrink();
//                         }
//
//                         final message = widget.messagesList[index];
//                         final isCurrentUser =
//                             userId != null && message?.sender?.id == userId;
//
//                         return Padding(
//                           padding: EdgeInsets.only(bottom: 25.w),
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: isCurrentUser
//                                     ? Alignment.centerRight
//                                     : Alignment.centerLeft,
//                                 child: Container(
//                                   constraints: BoxConstraints(
//                                     maxWidth:
//                                         MediaQuery.of(context).size.width * 0.7,
//                                   ),
//                                   margin: isCurrentUser
//                                       ? EdgeInsets.only(left: 28.w)
//                                       : EdgeInsets.only(right: 28.w),
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 10.h, horizontal: 15.w),
//                                   decoration: BoxDecoration(
//                                     color: isCurrentUser
//                                         ? Colors.blue
//                                         : const Color(0xffec9b2e),
//                                     borderRadius: isCurrentUser
//                                         ? BorderRadius.only(
//                                             topLeft: Radius.circular(19.r),
//                                             bottomLeft: Radius.circular(19.r),
//                                           )
//                                         : BorderRadius.only(
//                                             topRight: Radius.circular(19.r),
//                                             bottomRight: Radius.circular(19.r),
//                                           ),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment: isCurrentUser
//                                         ? CrossAxisAlignment.start
//                                         : CrossAxisAlignment.start,
//                                     children: [
//                                       widget.messagesList[index]!.type == "TEXT"
//                                           ? Align(
//                                               alignment: Alignment.centerLeft,
//                                               child: Text(
//                                                 widget.messagesList[index]
//                                                         ?.content ??
//                                                     "No Content",
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 14.sp,
//                                                   fontWeight:
//                                                       FontWeightHelper.light,
//                                                 ),
//                                               ),
//                                             )
//                                           : SingleChildScrollView(
//                                               scrollDirection: Axis.horizontal,
//                                               child: Row(
//                                                 children: [
//                                                   ...List.generate(
//                                                       widget
//                                                           .messagesList[index]!
//                                                           .media!
//                                                           .length, (ind) {
//                                                     return Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               right: 10),
//                                                       child:
//                                                           CachedNetworkImageUrl(
//                                                         url: widget
//                                                             .messagesList[
//                                                                 index]!
//                                                             .media![ind]
//                                                             .url,
//                                                         height: 150.h,
//                                                         width: 150.w,
//                                                         radius: 10,
//                                                       ),
//                                                     );
//                                                   })
//                                                 ],
//                                               ),
//                                             ),
//                                       verticalSpace(10),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           SvgPicture.asset(
//                                               "assets/svgs/done.svg"),
//                                           horizontalSpace(10),
//                                           Text(
//                                             widget.messagesList[index]
//                                                         ?.createdAt !=
//                                                     null
//                                                 ? timeago.format(
//                                                     DateTime.parse(widget
//                                                         .messagesList[index]!
//                                                         .createdAt
//                                                         .toString()),
//                                                     locale: 'en',
//                                                   )
//                                                 : '',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 12.sp,
//                                               fontWeight:
//                                                   FontWeightHelper.medium,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               if (!isCurrentUser)
//                                 Padding(
//                                   padding:
//                                       EdgeInsets.only(left: 33.w, top: 10.h),
//                                   child: Row(
//                                     children: [
//                                       ClipOval(
//                                         child: CachedNetworkImageUrl(
//                                           url: widget.messagesList[index]
//                                               ?.sender?.profilePicture,
//                                           height: 26.h,
//                                           width: 26.w,
//                                           radius: 0,
//                                         ),
//                                       ),
//                                       horizontalSpace(12),
//                                       Text(
//                                         '${widget.messagesList[index]?.sender?.firstName ?? ""} ${widget.messagesList[index]?.sender?.lastName ?? ""}',
//                                         style: TextStyle(
//                                           color: const Color(0xff484849),
//                                           fontSize: 13.sp,
//                                           fontWeight: FontWeightHelper.regular,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//                 // if (!_isAtBottom)
//                 //   Positioned(
//                 //     bottom: 20,
//                 //     right: 20,
//                 //     child: FloatingActionButton(
//                 //       onPressed: (){},
//                 //       child: Icon(Icons.arrow_downward),
//                 //     ),
//                 //   ),
//               ],
//             ),
//           );
//   }
// }
