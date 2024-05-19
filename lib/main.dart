
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_manager_app/core/services/notification_handler.dart';

import 'app.dart';
import 'core/data/constants/shared_constants_class.dart';
import 'core/presentation/resources/assets.gen.dart';
import 'core/utils/app_bloc_observer.dart';
import 'di/injection.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await initFirebaseApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await configureInjection();
  await EasyLocalization.ensureInitialized();

  /// load google maps dark styling string here to be used anywhere in the app without any delay !
  SharedConstantsClass.googleMapDarkStyleString =
      await rootBundle.loadString(Assets.googleMapsStyles.dark);

  Bloc.observer = AppBlocObserver();
  getIt<NotificationHandler>()
    ..listenForReceivedNotification()
    ..listenForSelectedNotification();

  Bloc.observer = AppBlocObserver();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/lang',
        fallbackLocale: const Locale('en'),
        child: App()),
  );
}

// Future<void> initFirebaseApp() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }
