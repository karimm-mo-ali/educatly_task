// import '../../../../core/networking/api_error_handler.dart';
// import '../../../../core/networking/api_result.dart';
// import '../../../../core/networking/api_service.dart';
// import '../../../../core/networking/socket_service.dart';
// import '../models/conversations_response.dart';
//
// class ChatsRepo {
//   final ApiService _apiService;
//   final SocketService _socketService;
//
//   ChatsRepo(this._apiService, this._socketService);
//
//   Future<ApiResult<ConversationsResponse>> getConversations(
//       {required int page, required int limit}) async {
//     try {
//       final response = await _apiService.getConversations(page, limit);
//       return ApiResult.success(response);
//     } catch (error) {
//       return ApiResult.failure(ApiErrorHandler.handle(error));
//     }
//   }
//
//   SocketService get socketService => _socketService;
// }
