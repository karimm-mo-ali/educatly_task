// import 'package:flutter/material.dart';
//
// class ChatsScreen extends StatefulWidget {
//   const ChatsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChatsScreen> createState() => _ChatsScreenState();
// }
//
// class _ChatsScreenState extends State<ChatsScreen> {
//   final chats = getChats();
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorConstants.lightBackgroundColor,
//         elevation: 0,
//         title: const Text('Chat', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w700),),
//         centerTitle: false,
//         actions: [
//           IconButton(
//             splashRadius: 20,
//             icon: Icon(Iconsax.search_normal_1, color: Colors.black, size: 22,),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20,),
//             Column(
//               children: chats.map((e) => Column(
//                 children: [
//                   ChatWidget(chat: e),
//                   chats.indexOf(e) != chats.length - 1 ? const Divider(indent: 80, height: 1, endIndent: 16,) : const SizedBox(),
//                 ],
//               )).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }