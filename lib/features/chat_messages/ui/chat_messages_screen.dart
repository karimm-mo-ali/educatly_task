// import 'dart:io';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../core/helpers/spacing.dart';
// import '../../../core/helpers/extensions.dart';
// import '../../../core/theming/colors.dart';
// import '../../../core/widgets/app_text_form_field.dart';
// import '../../../core/widgets/cached_network_image.dart';
// import '../../chats/data/models/conversations_response.dart';
// import '../../chats/logic/cubit/online_users_cubit.dart';
// import '../data/models/socket_message_model.dart';
// import '../logic/get_messages/messages_cubit.dart';
// import '../logic/send_media_message/send_media_message_cubit.dart';
// import 'widgets/messages_bloc_builder.dart';
// import 'widgets/send_media_message_bloc_listener.dart';
// import 'package:flutter/foundation.dart' as foundation;
//
// class ChatMessagesScreen extends StatefulWidget {
//   final String conversationId;
//   final List<Users?>? usersChatList;
//   const ChatMessagesScreen(
//       {super.key, required this.conversationId, required this.usersChatList});
//
//   @override
//   State<ChatMessagesScreen> createState() => _ChatMessagesScreenState();
// }
//
// class _ChatMessagesScreenState extends State<ChatMessagesScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final FocusNode _focusNode = FocusNode();
//   late bool _emojiShowing = false;
//   final List<File> _selectedFiles = [];
//   final ImagePicker _picker = ImagePicker();
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(() {
//       if (_focusNode.hasFocus && _emojiShowing) {
//         setState(() {
//           _emojiShowing = false;
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _focusNode.dispose();
//     _messageController.dispose();
//     super.dispose();
//   }
//
//   void _toggleEmojiKeyboard() {
//     if (_emojiShowing) {
//       setState(() {
//         _emojiShowing = false;
//       });
//       FocusScope.of(context).requestFocus(_focusNode);
//     } else {
//       setState(() {
//         _emojiShowing = true;
//       });
//       FocusScope.of(context).unfocus();
//     }
//   }
//
//   Future<void> _pickImages(ImageSource source) async {
//     try {
//       List<XFile>? pickedFiles;
//
//       if (source == ImageSource.gallery) {
//         pickedFiles = await _picker.pickMultiImage();
//       } else if (source == ImageSource.camera) {
//         final XFile? pickedFile =
//             await _picker.pickImage(source: ImageSource.camera);
//         if (pickedFile != null) {
//           pickedFiles = [pickedFile];
//         }
//       }
//
//       if (pickedFiles != null && pickedFiles.isNotEmpty) {
//         List<File> validFiles = [];
//         for (var file in pickedFiles) {
//           final pickedFile = File(file.path);
//           final fileSize = await pickedFile.length();
//
//           print("Picked file path: ${file.path}");
//           print("Picked file size: $fileSize bytes");
//
//           if (fileSize <= 5 * 1024 * 1024) {
//             validFiles.add(pickedFile);
//           } else {
//             _showError("File ${file.name} must not exceed 5 MB.");
//           }
//         }
//
//         int totalSelected = _selectedFiles.length + validFiles.length;
//
//         if (totalSelected <= 3) {
//           setState(() {
//             _selectedFiles.addAll(validFiles);
//
//             print(
//                 "_selectedFiles contains ${_selectedFiles.length} files after selection:");
//             for (var file in _selectedFiles) {
//               print(file.path);
//             }
//           });
//         } else {
//           _showError("You can only select a maximum of 3 images.");
//         }
//       }
//     } catch (e) {
//       _showError(
//           "Something went wrong while selecting images. Please try again.");
//       print(e.toString());
//     }
//   }
//
//   void _showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(message),
//       backgroundColor: Colors.redAccent,
//     ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final sortedUsersChatList = List<Users?>.from(widget.usersChatList!)
//       ..sort((a, b) {
//         final isAOnline = a != null &&
//             context.watch<OnlineUsersCubit>().isUserOnline(a.id ?? "");
//         final isBOnline = b != null &&
//             context.watch<OnlineUsersCubit>().isUserOnline(b.id ?? "");
//
//         if (isAOnline && !isBOnline) return -1;
//         if (!isAOnline && isBOnline) return 1;
//         return 0;
//       });
//
//     return GestureDetector(
//       onTap: (){
//         setState(() {
//           _emojiShowing = false;
//         });
//         FocusScope.of(context).unfocus();
//       },
//       // onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         resizeToAvoidBottomInset: true,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           elevation: 0.0,
//           backgroundColor: Colors.white,
//           centerTitle: true,
//           title: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: List.generate(sortedUsersChatList.length, (int index) {
//                 final isUserOnline = sortedUsersChatList[index] != null &&
//                     context
//                         .watch<OnlineUsersCubit>()
//                         .isUserOnline(sortedUsersChatList[index]!.id ?? "");
//
//                 return Padding(
//                   padding: EdgeInsets.only(right: 7.w),
//                   child: Stack(
//                     children: [
//                       ClipOval(
//                         child: CachedNetworkImageUrl(
//                           url: sortedUsersChatList[index]!.profilePicture,
//                           height: 32.h,
//                           width: 32.w,
//                           radius: 0,
//                         ),
//                       ),
//                       if (isUserOnline)
//                         Positioned(
//                           top: 0,
//                           right: 0,
//                           child: Container(
//                             height: 10.h,
//                             width: 10.w,
//                             decoration: BoxDecoration(
//                               color: Colors.green,
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Colors.white,
//                                 width: 1.5,
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 );
//               }),
//             ),
//           ),
//           leadingWidth: 75,
//           leading: IconButton(
//             padding: EdgeInsets.only(left: 28.w),
//             onPressed: () => Navigation(context).pop(),
//             icon: Container(
//               height: 38.h,
//               width: 38.w,
//               decoration: BoxDecoration(
//                 border: Border.all(color: const Color(0xffe1e1e1)),
//                 borderRadius: BorderRadius.circular(11.r),
//               ),
//               child: SvgPicture.asset(
//                 "assets/svgs/arrowLeft.svg",
//                 fit: BoxFit.scaleDown,
//               ),
//             ),
//           ),
//           actions: [
//             IconButton(
//               padding: EdgeInsets.only(right: 28.w),
//               onPressed: () {},
//               icon: SvgPicture.asset(
//                 "assets/svgs/search.svg",
//                 height: 20.h,
//                 width: 20.w,
//               ),
//             ),
//           ],
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom * 0.15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 MessagesBlocBuilder(conversationId: widget.conversationId),
//                 const SendMediaMessageBlocListener(),
//                 _buildSelectedMediaPreview(),
//                 Container(
//                   width: double.infinity,
//                   margin: EdgeInsets.only(top: 5.h),
//                   padding: EdgeInsets.only(left: 15.w, right: 15.w),
//                   color: Colors.white,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       _buildSelectedMediaPreview(),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 3,
//                             child: AppTextFormField(
//                               controller: _messageController,
//                               focusNode: _focusNode,
//                               hintText: "Say Something…",
//                               contentPadding: EdgeInsets.zero,
//                               validator: (value) {},
//                             ),
//                           ),
//                           const Spacer(),
//                           IconButton(
//                             padding: EdgeInsets.zero,
//                             visualDensity: const VisualDensity(horizontal: -4),
//                             icon: SvgPicture.asset("assets/svgs/attach.svg"),
//                             onPressed: () => _pickImages(ImageSource.gallery),
//                           ),
//                           horizontalSpace(15),
//                           IconButton(
//                             padding: EdgeInsets.zero,
//                             visualDensity: const VisualDensity(horizontal: -4),
//                             icon: SvgPicture.asset("assets/svgs/camera.svg"),
//                             onPressed: () => _pickImages(ImageSource.camera),
//                           ),
//                           horizontalSpace(15),
//                           IconButton(
//                             padding: EdgeInsets.zero,
//                             visualDensity: const VisualDensity(horizontal: -4),
//                             icon: SvgPicture.asset("assets/svgs/emoji.svg"),
//                             onPressed: _toggleEmojiKeyboard,
//                           ),
//                           horizontalSpace(18),
//                           SvgPicture.asset("assets/svgs/record.svg"),
//                           horizontalSpace(18),
//                           IconButton(
//                             padding: EdgeInsets.zero,
//                             visualDensity: const VisualDensity(horizontal: -4),
//                             icon: const Icon(Icons.send),
//                             onPressed: () async {
//                               final messageContent =
//                                   _messageController.text.trim();
//                               print(
//                                   "_selectedFiles contains ${_selectedFiles.length} files before upload");
//                               if (_selectedFiles.isNotEmpty) {
//                                 context
//                                     .read<SendMediaMessageCubit>()
//                                     .emitSendMediaMessageStates(
//                                       conversationId: widget.conversationId,
//                                       files: _selectedFiles,
//                                     );
//
//                                 setState(() {
//                                   _selectedFiles.clear();
//                                 });
//                               } else if (messageContent.isNotEmpty) {
//                                 // final now = DateTime.now().toUtc();
//                                 // final createdAt = now.toIso8601String();
//                                 final messageToSend = MessageToSend(
//                                   conversationId: widget.conversationId,
//                                   message: MessageContent(
//                                     type: 'TEXT',
//                                     content: messageContent,
//                                     // createdAt: createdAt,
//                                     media: null,
//                                   ),
//                                 );
//                                 context
//                                     .read<MessagesCubit>()
//                                     .sendMessage(messageToSend);
//                                 _messageController.clear();
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                       Container(
//                           width: double.infinity,
//                           height: 1.h,
//                           margin: EdgeInsets.only(top: 12.h),
//                           decoration: BoxDecoration(
//                               color: const Color(0xffe9eeed),
//                               borderRadius: BorderRadius.circular(0.5.r)))
//                     ],
//                   ),
//                 ),
//                 Offstage(
//                   offstage: !_emojiShowing,
//                   child: EmojiPicker(
//                     textEditingController: _messageController,
//                     config: Config(
//                       height: MediaQuery.of(context).size.height*0.3,
//                       checkPlatformCompatibility: true,
//                       viewOrderConfig:  ViewOrderConfig(
//                         top: EmojiPickerItem.searchBar,
//                         middle: EmojiPickerItem.categoryBar,
//                         bottom: EmojiPickerItem.emojiView,
//                       ),
//                       emojiViewConfig: EmojiViewConfig(
//                         emojiSizeMax: 28 *
//                             (foundation.defaultTargetPlatform ==
//                                     TargetPlatform.iOS
//                                 ? 1.2
//                                 : 1.0),
//                       ),
//                       skinToneConfig: const SkinToneConfig(),
//                       categoryViewConfig: const CategoryViewConfig(),
//                       bottomActionBarConfig: const BottomActionBarConfig(
//                         backgroundColor: ColorsManager.mainOrange,
//                         buttonIconColor: Colors.white,
//                         buttonColor: ColorsManager.mainOrange,
//                       ),
//                       searchViewConfig:  SearchViewConfig(
//                           backgroundColor: ColorsManager.mainOrange,
//                           buttonIconColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSelectedMediaPreview() {
//     if (_selectedFiles.isEmpty) return const SizedBox.shrink();
//
//     return Column(
//       children: [
//         SizedBox(
//           height: 100,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: _selectedFiles.length,
//             itemBuilder: (context, index) {
//               return Stack(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(right: 10),
//                     width: 120,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       image: DecorationImage(
//                         image: FileImage(_selectedFiles[index]),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 0,
//                     top: 0,
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _selectedFiles.removeAt(index);
//                         });
//                       },
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.redAccent,
//                         ),
//                         child: const Icon(
//                           Icons.close,
//                           size: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
