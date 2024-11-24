// import 'package:json_annotation/json_annotation.dart';
// part 'messages_response.g.dart';
//
// @JsonSerializable()
// class MessagesResponse {
//   @JsonKey(name: 'data')
//   List<Messages?>? messagesList;
//
//   MessagesResponse({
//     this.messagesList,
//   });
//
//   factory MessagesResponse.fromJson(Map<String, dynamic> json) =>
//       _$MessagesResponseFromJson(json);
// }
//
// @JsonSerializable()
// class Messages {
//   String? messageId;
//   String? conversationId;
//   String? type;
//   String? content;
//   String? createdAt;
//   Sender? sender;
//   bool? read;
//   List<Media>? media;
//
//   Messages({
//     this.messageId,
//     this.conversationId,
//     this.type,
//     this.content,
//     this.createdAt,
//     this.sender,
//     this.read,
//     this.media,
//   });
//
//   factory Messages.fromJson(Map<String, dynamic> json) =>
//       _$MessagesFromJson(json);
// }
//
// @JsonSerializable()
// class Sender {
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? profilePicture;
//
//   Sender({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.profilePicture,
//   });
//
//   factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);
// }
//
// @JsonSerializable()
// class Media {
//   String? id;
//   String? url;
//   String? fileType;
//   int? size;
//   String? originalName;
//   int? index;
//
//   Media({
//     this.id,
//     this.url,
//     this.fileType,
//     this.size,
//     this.originalName,
//     this.index,
//   });
//
//   factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
// }
