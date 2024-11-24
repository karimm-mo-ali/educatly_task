// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../../../../../core/helpers/spacing.dart';
// import '../../../../../../core/theming/colors.dart';
//
// class MessagesListShimmerLoading extends StatelessWidget {
//   const MessagesListShimmerLoading({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: 6,
//       itemBuilder: (context, index) {
//         bool isCurrentUser = index % 2 == 0;
//         return Padding(
//           padding: EdgeInsets.only(bottom: 25.w),
//           child: Column(
//             children: [
//               Align(
//                 alignment: isCurrentUser
//                     ? Alignment.centerRight
//                     : Alignment.centerLeft,
//                 child: Shimmer.fromColors(
//                   baseColor: ColorsManager.lightGray1,
//                   highlightColor: Colors.white,
//                   child: Container(
//                     constraints: BoxConstraints(
//                       maxWidth: MediaQuery.of(context).size.width * 0.7,
//                     ),
//                     margin: isCurrentUser
//                         ? EdgeInsets.only(left: 28.w)
//                         : EdgeInsets.only(right: 28.w),
//                     padding:
//                         EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
//                     decoration: BoxDecoration(
//                       color: ColorsManager.lightGray1,
//                       borderRadius: isCurrentUser
//                           ? BorderRadius.only(
//                               topLeft: Radius.circular(19.r),
//                               bottomLeft: Radius.circular(19.r),
//                             )
//                           : BorderRadius.only(
//                               topRight: Radius.circular(19.r),
//                               bottomRight: Radius.circular(19.r),
//                             ),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: isCurrentUser
//                           ? CrossAxisAlignment.end
//                           : CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 14.h,
//                           width: 180.w,
//                           color: ColorsManager.lightGray1,
//                         ),
//                         verticalSpace(10),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Container(
//                               height: 12.h,
//                               width: 20.w,
//                               color: ColorsManager.lightGray1,
//                             ),
//                             horizontalSpace(10),
//                             Container(
//                               height: 12.h,
//                               width: 50.w,
//                               color: ColorsManager.lightGray1,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               if (!isCurrentUser)
//                 Padding(
//                   padding: EdgeInsets.only(left: 33.w, top: 10.h),
//                   child: Row(
//                     children: [
//                       Shimmer.fromColors(
//                         baseColor: ColorsManager.lightGray1,
//                         highlightColor: Colors.white,
//                         child: ClipOval(
//                           child: Container(
//                             color: ColorsManager.lightGray1,
//                             height: 26.h,
//                             width: 26.w,
//                           ),
//                         ),
//                       ),
//                       horizontalSpace(12),
//                       Shimmer.fromColors(
//                         baseColor: ColorsManager.lightGray1,
//                         highlightColor: Colors.white,
//                         child: Container(
//                           height: 13.h,
//                           width: 100.w,
//                           decoration: BoxDecoration(
//                             color: ColorsManager.lightGray1,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
