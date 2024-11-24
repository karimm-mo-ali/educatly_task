// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../data/models/get_messages/messages_response.dart';
// import '../../data/models/socket_message_model.dart';
// import '../../data/repos/chat_messages_repo.dart';
// import 'messages_state.dart';
//
// class MessagesCubit extends Cubit<MessagesState> {
//   final ChatMessagesRepo _chatMessagesRepo;
//   final String conversationId;
//   ValueNotifier<DateTime> timeNotifier = ValueNotifier(DateTime.now());
//   Timer? _timestampTimer;
//
//   MessagesCubit(this._chatMessagesRepo, this.conversationId)
//       : super(const MessagesState.initial()) {
//     joinRoom(conversationId);
//     listenForNewMessages();
//     startTimestampUpdates();
//   }
//
//   int currentPage = 1;
//   bool isLoadingMore = false;
//   bool hasMoreData = true;
//   List<Messages> messagesList = [];
//   bool _isListeningForNewMessages = false;
//
//   void startTimestampUpdates() {
//     _timestampTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
//       if (!isClosed) {
//         timeNotifier.value = DateTime.now();
//       }
//     });
//   }
//
//   void listenForNewMessages() {
//     if (!_isListeningForNewMessages) {
//       _chatMessagesRepo.socketService.on('chat:new-message-in-room', (data) {
//         if (!isClosed) {
//           _onNewMessage(data);
//         }
//       });
//       _isListeningForNewMessages = true;
//     }
//   }
//
//   void joinRoom(String conversationId) {
//     _chatMessagesRepo.socketService.joinRoom(conversationId);
//   }
//
//   void leaveRoom(String conversationId) {
//     _chatMessagesRepo.socketService.leaveRoom(conversationId);
//     _chatMessagesRepo.socketService.off('chat:new-message-in-room');
//     _isListeningForNewMessages = false;
//   }
//
//   void getMessages({
//     required String conversationId,
//     int page = 1,
//     int limit = 10,
//     bool isLoadMore = false,
//   }) async {
//     if (isLoadMore && isLoadingMore) {
//       return;
//     }
//
//     if (!isLoadMore) emit(const MessagesState.messagesLoading());
//
//     if (isLoadMore) {
//       isLoadingMore = true;
//       emit(const MessagesState.messagesLoadingMore());
//     }
//
//     final response = await _chatMessagesRepo.getMessages(
//       conversationId: conversationId,
//       page: page,
//       limit: limit,
//     );
//     response.when(
//       success: (messagesResponse) {
//         final newMessages = (messagesResponse.messagesList ?? [])
//             .where((msg) => msg != null)
//             .cast<Messages>()
//             .toList();
//
//         if (isLoadMore) {
//           // messagesList.insertAll(0, newMessages);
//           messagesList.addAll(newMessages);
//         } else {
//           messagesList = newMessages;
//         }
//
//         hasMoreData = (messagesResponse.messagesList?.length ?? 0) == limit;
//
//         emit(MessagesState.messagesSuccess(List<Messages?>.from(messagesList)));
//
//         isLoadingMore = false;
//       },
//       failure: (apiErrorModel) {
//         if (!isLoadMore) {
//           emit(MessagesState.messagesError(apiErrorModel));
//         }
//         isLoadingMore = false;
//       },
//     );
//   }
//
//   void loadMoreMessages(String conversationId) {
//     if (hasMoreData && !isLoadingMore) {
//       currentPage++;
//       getMessages(
//         conversationId: conversationId,
//         page: currentPage,
//         isLoadMore: true,
//       );
//     }
//   }
//
//   void _onNewMessage(dynamic data) {
//     if (isClosed) return;
//     final messageJson = data as Map<String, dynamic>;
//     final messageData = messageJson['message'];
//
//     final senderJson = messageData['sender'] as Map<String, dynamic>;
//     final senderName = senderJson['name'] as String?;
//
//     final newMessage = Messages.fromJson(messageData);
//     if (senderName != null) {
//       final nameParts = senderName.split(' ');
//       newMessage.sender = Sender(
//         id: senderJson['id'] as String?,
//         firstName: nameParts.isNotEmpty ? nameParts[0] : null,
//         lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : null,
//         profilePicture: senderJson['profilePic'] as String?,
//       );
//     }
//
//     messagesList.insert(0, newMessage);
//     emit(
//         MessagesState<List<Messages>>.messagesSuccess(List.from(messagesList)));
//   }
//
//   void sendMessage(MessageToSend message) {
//     _chatMessagesRepo.socketService.sendMessage(message);
//   }
//
//   @override
//   Future<void> close() {
//     leaveRoom(conversationId);
//     timeNotifier.dispose();
//     _timestampTimer?.cancel();
//     return super.close();
//   }
// }
