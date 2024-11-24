// import 'dart:io';
// import 'package:dio/dio.dart';
// import '../../../../core/networking/api_error_handler.dart';
// import '../../../../core/networking/api_result.dart';
// import '../../../../core/networking/api_service.dart';
// import '../../../../core/networking/socket_service.dart';
// import '../models/get_messages/messages_response.dart';
// import '../models/send_media_message/send_media_message_response.dart';
//
// class ChatMessagesRepo {
//   final ApiService _apiService;
//   final SocketService _socketService;
//
//   ChatMessagesRepo(this._apiService, this._socketService);
//
//   Future<ApiResult<MessagesResponse>> getMessages({
//     required String conversationId,
//     required int page,
//     required int limit,
//   }) async {
//     try {
//       final response =
//           await _apiService.getMessages(conversationId, page, limit);
//       return ApiResult.success(response);
//     } catch (error) {
//       return ApiResult.failure(ApiErrorHandler.handle(error));
//     }
//   }
//
//   Future<ApiResult<SendMediaMessageResponse>> sendMediaMessage({
//     required String conversationId,
//     required List<File> files,
//   }) async {
//     try {
//       if (files.isEmpty) {
//         return ApiResult.failure(
//           ApiErrorHandler.handle('No files selected for upload.'),
//         );
//       }
//
//       List<MultipartFile> multipartFiles = [];
//       for (var file in files) {
//         if (await file.exists()) {
//           String fileName = file.path.split('/').last;
//
//           multipartFiles.add(
//             await MultipartFile.fromFile(
//               file.path,
//               filename: fileName,
//             ),
//           );
//         } else {
//           return ApiResult.failure(
//             ApiErrorHandler.handle('File not found: ${file.path}'),
//           );
//         }
//       }
//       FormData formData = FormData.fromMap({
//         'images': multipartFiles,
//       });
//
//       final response = await _apiService
//           .sendMediaMessage(
//         conversationId,
//         formData,
//       );
//
//       return ApiResult.success(response);
//     } catch (error) {
//       return ApiResult.failure(ApiErrorHandler.handle(error));
//     }
//   }
//
//   SocketService get socketService => _socketService;
// }
