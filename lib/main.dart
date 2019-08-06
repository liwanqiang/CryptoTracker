import 'dart:io' show Platform;
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/services.dart';
import 'package:cryptotracker/routes.dart';
import 'package:cryptotracker/others/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

import 'others/const.dart';

void main() {
  if (Platform.isAndroid) {
    // 设置沉浸式状态栏
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  // 设置只支持竖屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(EasyLocalization(
            child: MaterialApp(
                title: 'TRANSLATE',
                debugShowCheckedModeBanner: false,
                home: CreateApp()),
          )));
}

class CreateApp extends StatefulWidget {
  @override
  _CreateAppState createState() => _CreateAppState();
}

class _CreateAppState extends State<CreateApp> {
  bool isDark = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
        data: data,
        child: MaterialApp(
          title: 'iMovie',
          debugShowCheckedModeBanner: false,
          theme: isDark ? Constants.darkTheme : Constants.lightTheme,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            ChineseCupertinoLocalizations.delegate,
            EasylocaLizationDelegate(
                locale: data.locale ?? Locale('en', 'US'),
                path: 'assets/localizations'),
          ],
          supportedLocales: [
            Locale("en", "US"),
            Locale("zh", "HK"),
            Locale("zh", "TW"),
            Locale("ko"),
            Locale("pt"),
            Locale("ja"),
            Locale("zh", "CN"),
            Locale("fr"),
            Locale("es"),
            Locale('ar'),
          ],
          locale: data.locale,

          ///通过routes.buildPage的方式生成一个Widget
          home: AppRoute.global.buildPage(RoutePath.main, null),
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute<Object>(builder: (BuildContext context) {
              return AppRoute.global
                  .buildPage(settings.name, settings.arguments);
            });
          },
        ));
  }
}
