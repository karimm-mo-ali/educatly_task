// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'messages_response.dart';
//
// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************
//
// MessagesResponse _$MessagesResponseFromJson(Map<String, dynamic> json) =>
//     MessagesResponse(
//       messagesList: (json['data'] as List<dynamic>?)
//           ?.map((e) =>
//               e == null ? null : Messages.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );
//
// Map<String, dynamic> _$MessagesResponseToJson(MessagesResponse instance) =>
//     <String, dynamic>{
//       'data': instance.messagesList,
//     };
//
// Messages _$MessagesFromJson(Map<String, dynamic> json) => Messages(
//       messageId: json['messageId'] as String?,
//       conversationId: json['conversationId'] as String?,
//       type: json['type'] as String?,
//       content: json['content'] as String?,
//       createdAt: json['createdAt'] as String?,
//       sender: json['sender'] == null
//           ? null
//           : Sender.fromJson(json['sender'] as Map<String, dynamic>),
//       read: json['read'] as bool?,
//       media: (json['media'] as List<dynamic>?)
//           ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );
//
// Map<String, dynamic> _$MessagesToJson(Messages instance) => <String, dynamic>{
//       'messageId': instance.messageId,
//       'conversationId': instance.conversationId,
//       'type': instance.type,
//       'content': instance.content,
//       'createdAt': instance.createdAt,
//       'sender': instance.sender,
//       'read': instance.read,
//       'media': instance.media,
//     };
//
// Sender _$SenderFromJson(Map<String, dynamic> json) => Sender(
//       id: json['id'] as String?,
//       firstName: json['firstName'] as String?,
//       lastName: json['lastName'] as String?,
//       profilePicture: json['profilePicture'] as String?,
//     );
//
// Map<String, dynamic> _$SenderToJson(Sender instance) => <String, dynamic>{
//       'id': instance.id,
//       'firstName': instance.firstName,
//       'lastName': instance.lastName,
//       'profilePicture': instance.profilePicture,
//     };
//
// Media _$MediaFromJson(Map<String, dynamic> json) => Media(
//       id: json['id'] as String?,
//       url: json['url'] as String?,
//       fileType: json['fileType'] as String?,
//       size: (json['size'] as num?)?.toInt(),
//       originalName: json['originalName'] as String?,
//       index: (json['index'] as num?)?.toInt(),
//     );
//
// Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
//       'id': instance.id,
//       'url': instance.url,
//       'fileType': instance.fileType,
//       'size': instance.size,
//       'originalName': instance.originalName,
//       'index': instance.index,
//     };
