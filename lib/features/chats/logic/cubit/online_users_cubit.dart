// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/networking/socket_service.dart';
//
// // class OnlineUsersCubit extends Cubit<Map<String, bool>> {
// //   final SocketService _socketService;
// //
// //   OnlineUsersCubit(this._socketService) : super({}) {
// //     _loadInitialOnlineUsers();
// //
// //     _socketService.on('get-online-users', (onlineUserIds) {
// //       _updateOnlineUsers(onlineUserIds);
// //     });
// //   }
// //
// //   Future<void> _loadInitialOnlineUsers() async {
// //     final onlineUserIds = _socketService.getOnlineUsers();
// //     _updateOnlineUsers(onlineUserIds);
// //   }
// //
// //   void _updateOnlineUsers(List<dynamic> onlineUserIds) {
// //     Map<String, bool> onlineStatus = {};
// //     for (var id in onlineUserIds) {
// //       onlineStatus[id] = true;
// //     }
// //     emit(onlineStatus);
// //   }
// //
// //   bool isUserOnline(String userId) {
// //     return state[userId] ?? false;
// //   }
// // }
//
// class OnlineUsersCubit extends Cubit<Map<String, bool>> {
//   final SocketService _socketService;
//   bool _isClosed = false;
//
//   OnlineUsersCubit(this._socketService) : super({}) {
//     _loadInitialOnlineUsers();
//
//     _socketService.on('get-online-users', (onlineUserIds) {
//       if (!_isClosed) {
//         _updateOnlineUsers(onlineUserIds);
//       }
//     });
//   }
//
//   Future<void> _loadInitialOnlineUsers() async {
//     final onlineUserIds = _socketService.getOnlineUsers();
//     if (!_isClosed) {
//       _updateOnlineUsers(onlineUserIds);
//     }
//   }
//
//   void _updateOnlineUsers(List<dynamic> onlineUserIds) {
//     if (_isClosed) return;
//
//     final onlineStatus = <String, bool>{};
//     for (var id in onlineUserIds) {
//       onlineStatus[id] = true;
//     }
//     emit(onlineStatus);
//   }
//
//   bool isUserOnline(String userId) {
//     return state[userId] ?? false;
//   }
//
//   // @override
//   // Future<void> close() async {
//   //   _isClosed = true;
//   //   _socketService.off('get-online-users');
//   //   return super.close();
//   // }
// }
