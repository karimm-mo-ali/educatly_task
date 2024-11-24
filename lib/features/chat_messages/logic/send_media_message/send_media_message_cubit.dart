// import 'dart:io';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../data/models/socket_message_model.dart';
// import '../../data/repos/chat_messages_repo.dart';
// import 'send_media_message_state.dart';
//
// class SendMediaMessageCubit extends Cubit<SendMediaMessageState> {
//   final ChatMessagesRepo _chatMessagesRepo;
//   SendMediaMessageCubit(this._chatMessagesRepo)
//       : super(const SendMediaMessageState.initial());
//
//   void emitSendMediaMessageStates({
//     required String conversationId,
//     required List<File> files,
//   }) async {
//     emit(const SendMediaMessageState.sendMediaMessageLoading());
//     final clonedFiles = List<File>.from(files);
//     final response = await _chatMessagesRepo.sendMediaMessage(
//       conversationId: conversationId,
//       files: clonedFiles,
//     );
//     response.when(success: (sendMediaMessageResponse) async {
//       final mediaList = sendMediaMessageResponse.files?.map((file) {
//         return MediaFile(
//           key: file.key ?? '',
//           type: file.type ?? '',
//           size: file.size ?? 0,
//           originalName: file.originalName ?? '',
//         );
//       }).toList();
//
//       final mediaMessageToSend = MessageToSend(
//         conversationId: conversationId,
//         message: MessageContent(
//           type: 'MEDIA',
//           content: null,
//           media: mediaList,
//         ),
//       );
//
//       _chatMessagesRepo.socketService.sendMessage(mediaMessageToSend);
//
//       emit(SendMediaMessageState.sendMediaMessageSuccess(
//           sendMediaMessageResponse));
//     }, failure: (apiErrorModel) {
//       emit(SendMediaMessageState.sendMediaMessageError(apiErrorModel));
//     });
//   }
// }
