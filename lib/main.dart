import 'package:adhirat/controller/global_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:adhirat/utils/app_routes.dart';

import 'demo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  Get.put(GlobalController());
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('hi', 'hi'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
            .copyWith(background: Colors.black),
      ),
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
      // home: const DemoScreen(),
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
    );
  }
}
