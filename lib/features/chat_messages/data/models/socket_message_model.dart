// class MessageToSend {
//   final String conversationId;
//   final MessageContent message;
//
//   MessageToSend({
//     required this.conversationId,
//     required this.message,
//   });
//
//   Map<String, dynamic> toJson() => {
//         'conversationId': conversationId,
//         'message': message.toJson(),
//       };
// }
//
// class MessageContent {
//   final String? id;
//   final String type;
//   final String? content;
//   final MessageSender? sender;
//   final List<MediaFile>? media;
//   final String? createdAt;
//
//   MessageContent({
//     this.id,
//     required this.type,
//     required this.content,
//     this.sender,
//     required this.media,
//     this.createdAt,
//   });
//
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'type': type,
//         'content': content,
//         'sender': sender?.toJson(),
//         'media': media?.map((m) => m.toJson()).toList(),
//         'createdAt': createdAt,
//       };
//
//   factory MessageContent.fromJson(Map<String, dynamic> json) => MessageContent(
//         id: json['id'] as String?,
//         type: json['type'] as String,
//         content: json['content'] as String?,
//         sender: json['sender'] == null
//             ? null
//             : MessageSender.fromJson(json['sender'] as Map<String, dynamic>),
//         media: (json['media'] as List<dynamic>?)
//             ?.map((item) => MediaFile.fromJson(item as Map<String, dynamic>))
//             .toList(),
//         createdAt: json['createdAt'] as String?,
//       );
// }
//
// class MessageSender {
//   final String id;
//   final String name;
//   final String? profilePic;
//
//   MessageSender({
//     required this.id,
//     required this.name,
//     this.profilePic,
//   });
//
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         'profilePic': profilePic,
//       };
//
//   factory MessageSender.fromJson(Map<String, dynamic> json) => MessageSender(
//         id: json['id'] as String,
//         name: json['name'] as String,
//         profilePic: json['profilePic'] as String?,
//       );
// }
//
// class MediaFile {
//   final String key;
//   final String type;
//   final int size;
//   final String originalName;
//
//   MediaFile({
//     required this.key,
//     required this.type,
//     required this.size,
//     required this.originalName,
//   });
//
//   Map<String, dynamic> toJson() => {
//         'key': key,
//         'type': type,
//         'size': size,
//         'originalName': originalName,
//       };
//
//   factory MediaFile.fromJson(Map<String, dynamic> json) => MediaFile(
//         key: json['key'] as String,
//         type: json['type'] as String,
//         size: json['size'] as int,
//         originalName: json['originalName'] as String,
//       );
// }
