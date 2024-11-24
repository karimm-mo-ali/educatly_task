// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class LocalNotificationService {
//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   static StreamController<NotificationResponse> streamController =
//       StreamController();
//
//   // Handler for background messages
//   static Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     log("Handling a background message: ${message.messageId}");
//     if (message.data.isNotEmpty) {
//       final Map<String, dynamic> payload = message.data;
//       // handleNotificationTap(payload);
//     }
//   }
//
//   // static void onTap(NotificationResponse notificationResponse) {
//   //   log("Raw payload: ${notificationResponse.payload}");
//   //   try {
//   //     if (notificationResponse.payload != null) {
//   //       // Decode the outer JSON string
//   //       final Map<String, dynamic> outerPayload =
//   //           jsonDecode(notificationResponse.payload!);
//   //
//   //       // Extract the nested payload
//   //       if (outerPayload['payload'] != null) {
//   //         final Map<String, dynamic> decodedPayload =
//   //             jsonDecode(outerPayload['payload']);
//   //
//   //         // Handle the decoded payload
//   //         handleNotificationTap(decodedPayload);
//   //       } else {
//   //         log("Nested payload is null.");
//   //       }
//   //     } else {
//   //       log("Payload is null.");
//   //     }
//   //   } catch (e) {
//   //     log("Error during JSON decoding: $e");
//   //   }
//   //   streamController.add(notificationResponse);
//   // }
// ///
//   // static void handleNotificationTap(Map<String, dynamic> payload) {
//   //   final BuildContext? context = AppRoutes.navigatorKey.currentContext;
//   //
//   //   if (context == null) {
//   //     log('Error: Context is null, cannot navigate.');
//   //     return;
//   //   }
//   //
//   //   final String? screenName = payload['screen_name'];
//   //   final dynamic screenIndexDynamic = payload['screen_index'];
//   //   final dynamic screenIdDynamic = payload['screen_id'];
//   //   final dynamic caseStatusDynamic = payload['screen_caseStatus'];
//   //
//   //   log("Context: $context");
//   //   log("screenName: $screenName");
//   //   log("screenIndexDynamic: $screenIndexDynamic");
//   //   log("screenIdDynamic: $screenIdDynamic");
//   //   log("caseStatusDynamic: $caseStatusDynamic");
//   //
//   //   if (screenName != null) {
//   //     final Map<String, dynamic> arguments = {};
//   //
//   //     // Convert screenIndex to int if necessary
//   //     if (screenIndexDynamic != null) {
//   //       if (screenIndexDynamic is int) {
//   //         arguments['index'] = screenIndexDynamic;
//   //       } else if (screenIndexDynamic is String) {
//   //         final int? screenIndex = int.tryParse(screenIndexDynamic);
//   //         if (screenIndex != null) {
//   //           arguments['index'] = screenIndex;
//   //         } else {
//   //           arguments['index'] =
//   //               screenIndexDynamic; // Use as string if parsing fails
//   //         }
//   //       }
//   //     }
//   //
//   //     // Handle screenId
//   //     if (screenIdDynamic != null) {
//   //       if (screenIdDynamic is int) {
//   //         arguments['id'] = screenIdDynamic.toString();
//   //       } else if (screenIdDynamic is String) {
//   //         arguments['id'] = screenIdDynamic;
//   //       }
//   //     }
//   //
//   //     // Handle caseStatus
//   //     if (caseStatusDynamic != null) {
//   //       if (caseStatusDynamic is int) {
//   //         arguments['caseStatus'] = caseStatusDynamic.toString();
//   //       } else if (caseStatusDynamic is String) {
//   //         arguments['caseStatus'] = caseStatusDynamic;
//   //       }
//   //     }
//   //
//   //     // Add additional arguments for activityScreen
//   //     if (screenName == 'activityScreen') {
//   //       arguments['selectedCases'] = 'active';
//   //       arguments['fromNotificationScreen'] = false;
//   //     }
//   //
//   //     if (arguments.isEmpty) {
//   //       log('Navigating to $screenName without arguments');
//   //       Navigator.pushNamed(context, screenName);
//   //     } else {
//   //       log('Navigating to $screenName with arguments: $arguments');
//   //       Navigator.pushNamed(context, screenName, arguments: arguments);
//   //     }
//   //   } else {
//   //     log('Error: screen_name is null');
//   //   }
//   // }
//
//   static Future<void> init() async {
//     // Initialize Firebase
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//     InitializationSettings settings = const InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(),
//     );
//     flutterLocalNotificationsPlugin.initialize(
//       settings,
//       // onDidReceiveNotificationResponse: onTap,
//       // onDidReceiveBackgroundNotificationResponse: onTap,
//     );
//   }
//
//   static Future showBasicNotification(RemoteMessage message) async {
//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       Platform.isAndroid ? 'com.mulhem.drc' : 'com.mulhem.drc',
//       'DRC',
//       channelDescription: 'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//       enableVibration: true,
//     );
//
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       importance: Importance.max,
//     );
//
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     DarwinNotificationDetails iosNotificationDetails =
//         const DarwinNotificationDetails();
//
//     NotificationDetails notificationDetails = NotificationDetails(
//         android: androidNotificationDetails, iOS: iosNotificationDetails);
//
//     String payload = jsonEncode(message.data);
//
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       message.notification?.title,
//       message.notification?.body,
//       notificationDetails,
//       payload: payload,
//     );
//   }
// }
