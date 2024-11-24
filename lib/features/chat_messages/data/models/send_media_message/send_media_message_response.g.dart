// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'send_media_message_response.dart';
//
// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************
//
// SendMediaMessageResponse _$SendMediaMessageResponseFromJson(
//         Map<String, dynamic> json) =>
//     SendMediaMessageResponse(
//       files: (json['files'] as List<dynamic>?)
//           ?.map((e) => MediaFile.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );
//
// Map<String, dynamic> _$SendMediaMessageResponseToJson(
//         SendMediaMessageResponse instance) =>
//     <String, dynamic>{
//       'files': instance.files,
//     };
//
// MediaFile _$MediaFileFromJson(Map<String, dynamic> json) => MediaFile(
//       originalName: json['originalName'] as String?,
//       key: json['key'] as String?,
//       type: json['type'] as String?,
//       size: (json['size'] as num?)?.toInt(),
//     );
//
// Map<String, dynamic> _$MediaFileToJson(MediaFile instance) => <String, dynamic>{
//       'originalName': instance.originalName,
//       'key': instance.key,
//       'type': instance.type,
//       'size': instance.size,
//     };
