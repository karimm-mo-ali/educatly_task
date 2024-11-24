// import 'dart:developer';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'constants.dart';
// import 'local_notification_service.dart';
// import 'secure_storage_helper.dart';
// import 'package:http/http.dart' as http;
// import 'package:googleapis_auth/auth_io.dart' as auth;
//
// class PushNotificationsService {
//   static FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   static Future init() async {
//     await messaging.requestPermission();
//     await messaging.getToken().then((token) {
//       log("notification - FcmToken is $token");
//       SharedPrefHelper.setSecuredString(
//           SharedPrefKeys.fcmToken, token.toString());
//     }).catchError((err) {});
//     // Background - Terminated
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//     // Foreground
//     handleForegroundMessage();
//   }
//
//   static Future<String?> getAccessToken() async {
//     final serviceAccountJson = {
//       "type": "service_account",
//       "project_id": "drc1-3ca71",
//       "private_key_id": "274966407912aeb87a15f9d7827a41556c2e531b",
//       "private_key":
//           "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCimJFZy+iylEbd\nupiwk6uIiEYRdfDq5diwWdVoHRu8n5FMmyCN/nSwXilrw8D0i3DsAcAEp2XwLrCd\nvEsHE+rHQa9y/Nawqwu2/AJdY2Uh0+sIc0mJ7W4keUrBUpwPgKFX7mBjfZDlPxVi\nwrNBebX+dX5jVD4UR4NOV1VwnWlP9cZLjRJjJaBHhpSV0r8x1yx8K0OZ8YwlX7J/\nlWwcXO6bsDwOp/nhUuj4348p86egvEaprEuQNH+pwZZmF6rcYNKIKvBW4m4hhuoK\nIxEI6sNwkqwuzfxiw4KWNnMSibQ57MWKl3sBtZwSaxS6BuvlCQD5Fk94rY8kabJq\n672wEw6JAgMBAAECggEAAxQJ3m4YmfbqL4z2kpM9ImDYGMEHnl7bHx2YR3gTnBrW\nRKHEOEP6wBMMTDTAzLBuIx22XbAwox8zK01TC0+CeKLC+FWWl/IpDt4PCmcVFVKe\nhsKt//09glXEh0vx1e5Mv64s531LVre+xyeh/qmX+zkMu0MvSLGA6CUJok/snD2m\neRUXpQcuID5guzphNwOdXsySlVA4i7zFRIq1fWsSU764P1h+pEb8ZCQbKEaOJ9mI\nePkORSjRh/p/GS5kdfnMT46Ry0XNOfEmVZ5IaaLssM/aLu5FAB0D4e+teydU1Ged\nLn8gB4aYFu9VJX5IY1WFx6Zj7CVUsdhX+VumwSjynQKBgQDQYJhWY7mFVXVtGep+\nuSBxhUQejrLkLHEdFFgx+E0g5GqUhXYm0z/fo/yrRBeWbSGTHc68Frng+bKzICWX\n9Zomr+3Kaa25NFusDBTzF05eVqKkWNt2XG3j9FaJhJ1hdSxpdymYwnGk6ZhfkWly\nSyzOIRUnl/bgrVtEjZIGmDM1BQKBgQDHwXiHxa/aEk4Gmsgg0oBIrVvzMB1P0+8m\nZvZzUZh+/Q1uk4M5FDzi01BI+Io4oS0tsMrJQNLwpDBL/76rTQ+MdhqEGIPIHbud\nKCxWZA1/aSiDeGNLm1nMcmg1T6axAt4Ni7TAbhOBpn3+Y5Zuy9x8Dd9NoM2d3vxP\nSWNjrEjqtQKBgFEG/rW5GY7raDoAddrJCgCanZ50RsPLNEDmhFUKBJPhvj/6lbML\nOi8wiTPfynxH+2JFmPoyrBz7e62DtpqcelDI4GJxLYhy/6KrIApW6bZtYdkeZFhm\nIKUfgfb/hmM7OQXZvGcWVTKXUxT2alZzPPz6iEtZIDrFrlO96SZ/UIoxAoGAFJLq\ntSE5UX6dJrT+c9L6f4HLfKqx+izb7tqf+5Sl3j52CbOLym85LiuRk1J1+gsvugsB\nd+UDVOG0T7+Rhdc0CMWJSZ20xQG69x7SIju/4CWWlKPrpjfj8di+vu7rPkQLVt3S\nyhcMT0g0peTf851voh9Tpo0vYFk9J3VplTSDdhkCgYEAzFN3mapgegs2aofnrK5y\na4ow06BZiVl2gw/sTmX4weQCunslHtAqUTrsEYeMGJb9IpDD0ITLNtEqVoFRTI00\nzM56MarwMSoiG9fXqYROGYkdwQ6xYPU2haNgyAJ4k4PKDnPUM7K1Umq/FOO8fH1V\nwjVrWt0K3QCbLrME1cO9cR8=\n-----END PRIVATE KEY-----\n",
//       "client_email":
//           "firebase-adminsdk-1vp6c@drc1-3ca71.iam.gserviceaccount.com",
//       "client_id": "104037215379003345299",
//       "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//       "token_uri": "https://oauth2.googleapis.com/token",
//       "auth_provider_x509_cert_url":
//           "https://www.googleapis.com/oauth2/v1/certs",
//       "client_x509_cert_url":
//           "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-1vp6c%40drc1-3ca71.iam.gserviceaccount.com",
//       "universe_domain": "googleapis.com"
//     };
//
//     List<String> scopes = [
//       "https://www.googleapis.com/auth/userinfo.email",
//       "https://www.googleapis.com/auth/firebase.database",
//       "https://www.googleapis.com/auth/firebase.messaging"
//     ];
//
//     try {
//       http.Client client = await auth.clientViaServiceAccount(
//           auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);
//
//       auth.AccessCredentials credentials =
//           await auth.obtainAccessCredentialsViaServiceAccount(
//               auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
//               scopes,
//               client);
//
//       client.close();
//       print(
//           "Access Token: ${credentials.accessToken.data}"); // Print Access Token
//       return credentials.accessToken.data;
//     } catch (e) {
//       print("Error getting access token: $e");
//       return null;
//     }
//   }
//
//   static Future<void> handleBackgroundMessage(RemoteMessage message) async {
//     await Firebase.initializeApp();
//     if (message.data.isNotEmpty) {
//       LocalNotificationService.showBasicNotification(message);
//     }
//   }
//
//   static void handleForegroundMessage() {
//     FirebaseMessaging.onMessage.listen(
//       (RemoteMessage message) {
//         LocalNotificationService.showBasicNotification(message);
//       },
//     );
//   }
// }
