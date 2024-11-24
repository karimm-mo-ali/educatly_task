// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/di/dependency_injection.dart';
// import '../../../../core/networking/socket_service.dart';
// import '../../data/models/conversations_response.dart';
// import '../../data/repos/chats_repo.dart';
// import 'conversations_state.dart';
//
// class ConversationsCubit extends Cubit<ConversationsState> {
//   final ChatsRepo _chatsRepo;
//   final SocketService _socketService = getIt<SocketService>();
//   ValueNotifier<DateTime> timeNotifier = ValueNotifier(DateTime.now());
//
//   ConversationsCubit(this._chatsRepo)
//       : super(const ConversationsState.initial()) {
//     _connectSocket();
//     listenForNewMessages();
//     startTimestampUpdates();
//   }
//
//   int currentPage = 1;
//   bool isLoadingMore = false;
//   bool hasMoreData = true;
//   List<Conversations?>? conversationsList = [];
//   bool _isListeningForNewMessages = false;
//
//   Future<void> _connectSocket() async {
//     await _socketService.connect();
//   }
//
//   void startTimestampUpdates() {
//     Timer.periodic(const Duration(seconds: 30), (timer) {
//       timeNotifier.value = DateTime.now();
//     });
//   }
//
//   void listenForNewMessages() {
//     if (!_isListeningForNewMessages) {
//       _chatsRepo.socketService.on('chat:new-message-in-conversation-list',
//           (data) {
//         _onNewMessage(data);
//       });
//       _isListeningForNewMessages = true;
//     }
//   }
//
//   void getConversations({
//     int page = 1,
//     int limit = 10,
//     bool isLoadMore = false,
//   }) async {
//     if (isLoadMore && isLoadingMore) {
//       return;
//     }
//     if (!isLoadMore) emit(const ConversationsState.conversationsLoading());
//
//     if (isLoadMore) {
//       isLoadingMore = true;
//       emit(const ConversationsState.conversationsLoadingMore());
//     }
//
//     final response = await _chatsRepo.getConversations(
//       page: page,
//       limit: limit,
//     );
//     response.when(
//       success: (conversationsResponse) {
//         if (isLoadMore) {
//           conversationsList!
//               .addAll(conversationsResponse.conversationsList ?? []);
//         } else {
//           conversationsList = conversationsResponse.conversationsList ?? [];
//         }
//
//         hasMoreData =
//             (conversationsResponse.conversationsList?.length ?? 0) == limit;
//
//         emit(ConversationsState.conversationsSuccess(
//             List<Conversations?>.from(conversationsList!)));
//
//         isLoadingMore = false;
//       },
//       failure: (apiErrorModel) {
//         if (!isLoadMore) {
//           emit(ConversationsState.conversationsError(apiErrorModel));
//         }
//         isLoadingMore = false;
//       },
//     );
//   }
//
//   void loadMoreConversations() {
//     if (hasMoreData && !isLoadingMore) {
//       currentPage++;
//       getConversations(page: currentPage, isLoadMore: true);
//     }
//   }
//
//   void _onNewMessage(dynamic data) {
//     final conversationId = data['conversationId'];
//     final lastMessageData = data['message'];
//
//     if (lastMessageData['type'] == 'MEDIA' &&
//         lastMessageData['content'] == null) {
//       lastMessageData['content'] = 'Media';
//       lastMessageData['isPlaceholder'] = true;
//     }
//
//     final currentState = state;
//     if (currentState is ConversationsSuccess) {
//       List<Conversations?> conversationsList = currentState.data;
//       List<Conversations> nonNullConversationsList = conversationsList
//           .where((conversation) => conversation != null)
//           .cast<Conversations>()
//           .toList();
//
//       Conversations? updatedConversation;
//       nonNullConversationsList = nonNullConversationsList.map((conversation) {
//         if (conversation.conversationId == conversationId) {
//           updatedConversation = conversation.copyWith(
//             lastMessage: LastMessage.fromJson(lastMessageData),
//           );
//           return updatedConversation!;
//         }
//         return conversation;
//       }).toList();
//
//       if (updatedConversation != null) {
//         nonNullConversationsList.remove(updatedConversation);
//         nonNullConversationsList.insert(0, updatedConversation!);
//       }
//
//       emit(ConversationsState.conversationsSuccess(nonNullConversationsList));
//     }
//   }
// }
