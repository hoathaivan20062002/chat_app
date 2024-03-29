import 'package:chat_app/auth/screens/log_in.dart';
import 'package:chat_app/auth/screens/verify_page.dart';
import 'package:chat_app/chat/screens/about_page.dart';
import 'package:chat_app/chat/services/notification_services.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'chat/you_are_in.dart';
// import 'languages/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Transparent status bar, dont need to use SafeArea
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // print('currentUser:');
  // print(FirebaseAuth.instance.currentUser);
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  await NotificationServices.initialize(flutterLocalNotificationsPlugin);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false, // Tắt debug banner góc phải màn hình app
      // locale: Localization.inst.defaultLocale,
      // fallbackLocale: Localization.inst.defaultLocale,
      // translations: Localization.inst,
      home: const AboutPage(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;

    if (user == null) return const SignIn();

    if (!user.emailVerified) return const VerifyPage();

    return const YouAreIn();
  }
}
