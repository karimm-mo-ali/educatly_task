// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
// import '../../../../core/di/dependency_injection.dart';
// import '../../../../core/helpers/spacing.dart';
// import '../../../../core/theming/colors.dart';
// import '../../../../core/theming/font_weight_helper.dart';
// import '../../../chat_messages/data/repos/chat_messages_repo.dart';
// import '../../../chat_messages/logic/get_messages/messages_cubit.dart';
// import '../../../chat_messages/logic/send_media_message/send_media_message_cubit.dart';
// import '../../../chat_messages/ui/chat_messages_screen.dart';
// import '../../data/models/conversations_response.dart';
// import '../../logic/cubit/conversations_cubit.dart';
// import '../../logic/cubit/conversations_state.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import '../../logic/cubit/online_users_cubit.dart';
//
// class ConversationListView extends StatefulWidget {
//   final List<Conversations?> conversationsList;
//   final ConversationsState currentState;
//
//   const ConversationListView(
//       {super.key, required this.conversationsList, required this.currentState});
//
//   @override
//   State<ConversationListView> createState() => _ConversationListViewState();
// }
//
// class _ConversationListViewState extends State<ConversationListView> {
//   final ScrollController _scrollController = ScrollController();
//   late DateTime localDateTime;
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }
//
//   void _onScroll() {
//     if (_scrollController.position.pixels ==
//         _scrollController.position.maxScrollExtent) {
//       context.read<ConversationsCubit>().loadMoreConversations();
//     }
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
//     final cubit = context.read<ConversationsCubit>();
//     return widget.conversationsList.isEmpty
//         ? Expanded(
//             child: Center(
//               child: Text(
//                 "No conversations available.",
//                 style: TextStyle(fontSize: 16.sp, color: Colors.grey),
//               ),
//             ),
//           )
//         : Expanded(
//             child: ValueListenableBuilder<DateTime>(
//                 valueListenable: cubit.timeNotifier,
//                 builder: (context, currentTime, _) {
//                   return ListView.builder(
//                     controller: _scrollController,
//                     shrinkWrap: true,
//                     padding: EdgeInsets.only(bottom: 22.h, top: 10.h),
//                     itemCount: widget.conversationsList.length +
//                         (widget.currentState is ConversationsLoadingMore
//                             ? 1
//                             : 0),
//                     itemBuilder: (context, index) {
//                       final createdAtString = widget
//                           .conversationsList[index]?.lastMessage?.createdAt;
//                       if (createdAtString != null) {
//                         var date = DateFormat("yyyy-MM-ddTHH:mm:ss")
//                             .parse(createdAtString, true);
//                         localDateTime = date.toLocal();
//                       }
//
//                       if (index == widget.conversationsList.length) {
//                         return widget.currentState is ConversationsLoadingMore
//                             ? const Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 8),
//                                 child:
//                                     Center(child: CircularProgressIndicator()),
//                               )
//                             : const SizedBox.shrink();
//                       }
//
//                       final userList =
//                           widget.conversationsList[index]?.usersList ?? [];
//
//                       final isAnyUserOnline = userList.any(
//                         (user) => context
//                             .watch<OnlineUsersCubit>()
//                             .isUserOnline(user!.id ?? ""),
//                       );
//
//                       return InkWell(
//                         onTap: () {
//                           pushScreen(
//                             context,
//                             screen: MultiBlocProvider(
//                               providers: [
//                                 BlocProvider(
//                                   create: (context) => MessagesCubit(
//                                     getIt<ChatMessagesRepo>(),
//                                     widget.conversationsList[index]
//                                             ?.conversationId ??
//                                         "",
//                                   )..getMessages(
//                                       conversationId: widget
//                                               .conversationsList[index]
//                                               ?.conversationId ??
//                                           "",
//                                     ),
//                                 ),
//                                 BlocProvider(
//                                   create: (context) =>
//                                       getIt<OnlineUsersCubit>(),
//                                 ),
//                                 BlocProvider(
//                                   create: (context) =>
//                                       getIt<SendMediaMessageCubit>(),
//                                 ),
//                               ],
//                               child: ChatMessagesScreen(
//                                   conversationId: widget
//                                           .conversationsList[index]
//                                           ?.conversationId ??
//                                       "",
//                                   usersChatList: userList),
//                             ),
//                             withNavBar: false,
//                           );
//                         },
//                         child: Padding(
//                           padding: EdgeInsets.only(bottom: 30.h),
//                           child: Row(
//                             children: [
//                               Stack(
//                                 children: [
//                                   Image.asset("assets/images/userPic.jpg",
//                                       height: 45.h, width: 45.w),
//                                   if (isAnyUserOnline)
//                                     Positioned(
//                                       top: 0,
//                                       right: 0,
//                                       child: Container(
//                                         height: 15.h,
//                                         width: 15.w,
//                                         decoration: BoxDecoration(
//                                           color: Colors.green,
//                                           shape: BoxShape.circle,
//                                           border: Border.all(
//                                             color: Colors.white,
//                                             width: 1.5,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                 ],
//                               ),
//                               horizontalSpace(10),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Expanded(
//                                           flex: 2,
//                                           child: Text(
//                                             widget.conversationsList[index]
//                                                     ?.namesList
//                                                     ?.join(", ") ??
//                                                 "",
//                                             overflow: TextOverflow.ellipsis,
//                                             style: TextStyle(
//                                               color: const Color(0xff484849),
//                                               fontSize: 15.sp,
//                                               fontWeight:
//                                                   FontWeightHelper.medium,
//                                             ),
//                                           ),
//                                         ),
//                                         horizontalSpace(5),
//                                         Container(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 8.w, vertical: 4.h),
//                                           decoration: BoxDecoration(
//                                             color: const Color(0xffdff3e7),
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                           ),
//                                           child: Text(
//                                             widget.conversationsList[index]
//                                                     ?.status ??
//                                                 "",
//                                             style: TextStyle(
//                                               color: const Color(0xff5d5d5d),
//                                               fontSize: 12.sp,
//                                               fontWeight:
//                                                   FontWeightHelper.regular,
//                                             ),
//                                           ),
//                                         ),
//                                         const Spacer(),
//                                         SvgPicture.asset(
//                                             "assets/svgs/options.svg",
//                                             height: 5.h,
//                                             width: 15.w),
//                                       ],
//                                     ),
//                                     verticalSpace(5),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Expanded(
//                                           child: Row(
//                                             children: [
//                                               if (widget
//                                                       .conversationsList[index]
//                                                       ?.lastMessage
//                                                       ?.messageType ==
//                                                   "MEDIA")
//                                                 const Padding(
//                                                   padding:
//                                                       EdgeInsets.only(right: 5),
//                                                   child: Icon(Icons.photo,
//                                                       color: ColorsManager
//                                                           .mainOrange,
//                                                       size: 20),
//                                                 ),
//                                               if (widget
//                                                       .conversationsList[index]
//                                                       ?.lastMessage
//                                                       ?.isPlaceholder ==
//                                                   true)
//                                                 const Padding(
//                                                   padding:
//                                                       EdgeInsets.only(right: 5),
//                                                   child: Icon(Icons.photo,
//                                                       color: ColorsManager
//                                                           .mainOrange,
//                                                       size: 20),
//                                                 ),
//                                               Text(
//                                                 widget
//                                                         .conversationsList[
//                                                             index]
//                                                         ?.lastMessage
//                                                         ?.content ??
//                                                     (widget
//                                                                 .conversationsList[
//                                                                     index]
//                                                                 ?.lastMessage
//                                                                 ?.messageType ==
//                                                             "MEDIA"
//                                                         ? "Media"
//                                                         : ""),
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: TextStyle(
//                                                   color:
//                                                       const Color(0xff484849),
//                                                   fontSize: 14.sp,
//                                                   fontWeight:
//                                                       FontWeightHelper.light,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         horizontalSpace(20),
//                                         Text(
//                                           createdAtString != null
//                                               ? timeago.format(
//                                                   localDateTime,
//                                                   locale: 'en',
//                                                   clock: currentTime,
//                                                 )
//                                               : '',
//                                           style: TextStyle(
//                                             color: const Color(0xff484849),
//                                             fontSize: 11.sp,
//                                             fontWeight:
//                                                 FontWeightHelper.regular,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }),
//           );
//   }
// }
