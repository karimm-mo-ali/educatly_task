// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../../../../../core/helpers/spacing.dart';
// import '../../../../../../core/theming/colors.dart';
//
// class ConversationShimmerLoading extends StatelessWidget {
//   const ConversationShimmerLoading({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: 15,
//         padding: EdgeInsets.only(bottom: 22.h, top: 10.h),
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.only(bottom: 30.h),
//             child: Row(
//               children: [
//                 Shimmer.fromColors(
//                   baseColor: ColorsManager.lightGray1,
//                   highlightColor: Colors.white,
//                   child: Container(
//                     height: 45.h,
//                     width: 45.w,
//                     decoration: const BoxDecoration(
//                       color: ColorsManager.lightGray1,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//                 horizontalSpace(10),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: Shimmer.fromColors(
//                               baseColor: ColorsManager.lightGray1,
//                               highlightColor: Colors.white,
//                               child: Container(
//                                 height: 15.sp,
//                                 width: 100.w,
//                                 color: ColorsManager.lightGray1,
//                               ),
//                             ),
//                           ),
//                           horizontalSpace(5),
//                           Shimmer.fromColors(
//                             baseColor: ColorsManager.lightGray1,
//                             highlightColor: Colors.white,
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 8.w, vertical: 4.h),
//                               height: 18.h,
//                               width: 50.w,
//                               decoration: BoxDecoration(
//                                 color: ColorsManager.lightGray1,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       verticalSpace(5),
//                       Shimmer.fromColors(
//                         baseColor: ColorsManager.lightGray1,
//                         highlightColor: Colors.white,
//                         child: Container(
//                           height: 14.sp,
//                           width: 150.w,
//                           color: ColorsManager.lightGray1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 horizontalSpace(20),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Shimmer.fromColors(
//                       baseColor: ColorsManager.lightGray1,
//                       highlightColor: Colors.white,
//                       child: Container(
//                         height: 5.h,
//                         width: 15.w,
//                         color: ColorsManager.lightGray1,
//                       ),
//                     ),
//                     verticalSpace(15),
//                     Shimmer.fromColors(
//                       baseColor: ColorsManager.lightGray1,
//                       highlightColor: Colors.white,
//                       child: Container(
//                         height: 11.sp,
//                         width: 60.w,
//                         color: ColorsManager.lightGray1,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
