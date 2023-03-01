

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jump_q/environment.dart';
import 'package:get/get.dart';
import 'package:jump_q/notifire/image_notifire.dart';
import 'package:jump_q/route.dart';
import 'package:jump_q/splash_screen.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/loginandsignup/login_page.dart';
import 'package:provider/provider.dart';
import 'controllers/bindings/initial_binding.dart';
import 'data/mapper/mapper.dart';
import 'package:firebase_core/firebase_core.dart';


const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
   // 'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('A bg message just showed up :  ${message.messageId}');
}



Future<void> setupInteractedMessage() async {
  //RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();

  // Also handle any interaction when the app is in the background via a
  // Stream listener
      ///on background run app massage
      await FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    debugPrint("onMessageOpenedApp: $message");

    LogInScreen.start();
    /*if (message.data["navigation"] == "/your_route") {
      int _yourId = int.tryParse(message.data["id"]) ?? 0;
    }*/
  });

}


Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Firebase.initializeApp().whenComplete(() {
  //   print("completed");
  //
  // });

  /// FIXME Remove this check when firebase setup is ready for iOS
  //if(Platform.isAndroid) {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    setupInteractedMessage();
  // }



  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  MapperFactory.initialize();
  await Environment.initialize(env);
  debugPrint("MainCommon Env $env");
  await InitialBindings().dependencies();

  runApp(ChangeNotifierProvider(
    create: (_) => ProfileImageNotifier(),
    child: getMaterialApp,
  ));
  //runApp(getMaterialApp);
}


GetMaterialApp get getMaterialApp => GetMaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [],
      locale: Get.deviceLocale,
      fallbackLocale:
          const Locale.fromSubtags(languageCode: 'en', countryCode: ' US'),
      theme: ThemeData(
        primarySwatch: MyColors.appColor,
      ),
      getPages: Routes.get(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child ?? Container(),
        );
      },
      defaultTransition: Transition.rightToLeftWithFade,
      initialRoute: SplashScreen.routeName,
    );
