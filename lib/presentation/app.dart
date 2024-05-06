import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_micro_frontend/presentation/localization/localization.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ui/ui.dart';

import '../environments/environment.dart';
import 'routes.dart';

void startApp() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });
  FlavorConfig.env.modules.initEnv();
  await FlavorConfig.env.modules.inject();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();

  static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: GetMaterialApp(
        title: 'Flutter Micro Frontend',
        theme: uiTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalization.delegate,
          ...FlavorConfig.env.modules.localizationsDelegates
        ],
        locale: Get.deviceLocale,
        supportedLocales: const [
          Locale.fromSubtags(languageCode: 'en'),
          Locale.fromSubtags(languageCode: 'vi'),
        ],
        initialRoute: MainRouteName.splash,
        getPages: [...MainRoutePages.pages],
      ),
    );
  }
}
