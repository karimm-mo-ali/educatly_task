// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'conversations_response.dart';
//
// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************
//
// ConversationsResponse _$ConversationsResponseFromJson(
//         Map<String, dynamic> json) =>
//     ConversationsResponse(
//       conversationsList: (json['data'] as List<dynamic>?)
//           ?.map((e) => e == null
//               ? null
//               : Conversations.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );
//
// Map<String, dynamic> _$ConversationsResponseToJson(
//         ConversationsResponse instance) =>
//     <String, dynamic>{
//       'data': instance.conversationsList,
//     };
//
// Conversations _$ConversationsFromJson(Map<String, dynamic> json) =>
//     Conversations(
//       conversationId: json['conversationId'] as String?,
//       type: json['type'] as String?,
//       status: json['status'] as String?,
//       lastMessage: json['lastMessage'] == null
//           ? null
//           : LastMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
//       usersList: (json['users'] as List<dynamic>?)
//           ?.map((e) =>
//               e == null ? null : Users.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       namesList:
//           (json['names'] as List<dynamic>?)?.map((e) => e as String?).toList(),
//     );
//
// Map<String, dynamic> _$ConversationsToJson(Conversations instance) =>
//     <String, dynamic>{
//       'conversationId': instance.conversationId,
//       'type': instance.type,
//       'status': instance.status,
//       'lastMessage': instance.lastMessage,
//       'users': instance.usersList,
//       'names': instance.namesList,
//     };
//
// LastMessage _$LastMessageFromJson(Map<String, dynamic> json) => LastMessage(
//       messageId: json['messageId'] as String?,
//       content: json['content'] as String?,
//       sender: json['sender'] == null
//           ? null
//           : Sender.fromJson(json['sender'] as Map<String, dynamic>),
//       messageType: json['messageType'] as String?,
//       createdAt: json['createdAt'] as String?,
//       isPlaceholder: json['isPlaceholder'] as bool? ?? false,
//     );
//
// Map<String, dynamic> _$LastMessageToJson(LastMessage instance) =>
//     <String, dynamic>{
//       'messageId': instance.messageId,
//       'content': instance.content,
//       'sender': instance.sender,
//       'messageType': instance.messageType,
//       'createdAt': instance.createdAt,
//       'isPlaceholder': instance.isPlaceholder,
//     };
//
// Sender _$SenderFromJson(Map<String, dynamic> json) => Sender(
//       id: json['id'] as String?,
//       firstName: json['firstName'] as String?,
//     );
//
// Map<String, dynamic> _$SenderToJson(Sender instance) => <String, dynamic>{
//       'id': instance.id,
//       'firstName': instance.firstName,
//     };
//
// Users _$UsersFromJson(Map<String, dynamic> json) => Users(
//       id: json['id'] as String?,
//       firstName: json['firstName'] as String?,
//       lastName: json['lastName'] as String?,
//       profilePicture: json['profilePicture'] as String?,
//     );
//
// Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
//       'id': instance.id,
//       'firstName': instance.firstName,
//       'lastName': instance.lastName,
//       'profilePicture': instance.profilePicture,
//     };
