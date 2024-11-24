// import 'package:json_annotation/json_annotation.dart';
// part 'conversations_response.g.dart';
//
// @JsonSerializable()
// class ConversationsResponse {
//   @JsonKey(name: 'data')
//   List<Conversations?>? conversationsList;
//
//   ConversationsResponse({
//     this.conversationsList,
//   });
//
//   factory ConversationsResponse.fromJson(Map<String, dynamic> json) =>
//       _$ConversationsResponseFromJson(json);
// }
//
// @JsonSerializable()
// class Conversations {
//   String? conversationId;
//   String? type;
//   String? status;
//   LastMessage? lastMessage;
//   @JsonKey(name: 'users')
//   List<Users?>? usersList;
//   @JsonKey(name: 'names')
//   List<String?>? namesList;
//
//   Conversations({
//     this.conversationId,
//     this.type,
//     this.status,
//     this.lastMessage,
//     this.usersList,
//     this.namesList,
//   });
//
//   factory Conversations.fromJson(Map<String, dynamic> json) =>
//       _$ConversationsFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ConversationsToJson(this);
//
//   Conversations copyWith({
//     String? conversationId,
//     String? type,
//     String? status,
//     LastMessage? lastMessage,
//     List<Users?>? usersList,
//     List<String?>? namesList,
//   }) {
//     return Conversations(
//       conversationId: conversationId ?? this.conversationId,
//       type: type ?? this.type,
//       status: status ?? this.status,
//       lastMessage: lastMessage ?? this.lastMessage,
//       usersList: usersList ?? this.usersList,
//       namesList: namesList ?? this.namesList,
//     );
//   }
// }
//
// @JsonSerializable()
// class LastMessage {
//   String? messageId;
//   String? content;
//   Sender? sender;
//   String? messageType;
//   String? createdAt;
//   bool isPlaceholder;
//
//   LastMessage({
//     this.messageId,
//     this.content,
//     this.sender,
//     this.messageType,
//     this.createdAt,
//     this.isPlaceholder = false,
//   });
//
//   factory LastMessage.fromJson(Map<String, dynamic> json) =>
//       _$LastMessageFromJson(json);
//
//   Map<String, dynamic> toJson() => _$LastMessageToJson(this);
//
//   LastMessage copyWith({
//     String? messageId,
//     String? content,
//     Sender? sender,
//     String? messageType,
//     String? createdAt,
//     bool? isPlaceholder,
//   }) {
//     return LastMessage(
//       messageId: messageId ?? this.messageId,
//       content: content ?? this.content,
//       sender: sender ?? this.sender,
//       messageType: messageType ?? this.messageType,
//       createdAt: createdAt ?? this.createdAt,
//       isPlaceholder: isPlaceholder ?? this.isPlaceholder,
//     );
//   }
// }
//
// @JsonSerializable()
// class Sender {
//   String? id;
//   String? firstName;
//
//   Sender({
//     this.id,
//     this.firstName,
//   });
//
//   factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);
//
//   Map<String, dynamic> toJson() => _$SenderToJson(this);
//
//   Sender copyWith({
//     String? id,
//     String? firstName,
//   }) {
//     return Sender(
//       id: id ?? this.id,
//       firstName: firstName ?? this.firstName,
//     );
//   }
// }
//
// @JsonSerializable()
// class Users {
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? profilePicture;
//
//   Users({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.profilePicture,
//   });
//
//   factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
// }
