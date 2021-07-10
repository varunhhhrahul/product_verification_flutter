// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:product_verification_flutter/screens/failure_screen.dart';
import 'package:product_verification_flutter/screens/home_screen.dart';
import 'package:product_verification_flutter/screens/success_screen.dart';
import 'package:product_verification_flutter/utils/theme.dart';

import 'constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends HookWidget {
  // const MyApp({Key? key}) : super(key: key);
  const MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Product Verification',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: Routes.HOME_SCREEN,
      routes: {
        Routes.HOME_SCREEN: (context) => HomeScreen(
              // arguments: ModalRoute.of(context)!.settings.arguments
              //     as HomeScreenArguments?,
              arguments: ModalRoute.of(context).settings.arguments
                  as HomeScreenArguments,
            ),
        Routes.SUCCESS_SCREEN: (context) => SuccessScreen(
              // arguments: ModalRoute.of(context)!.settings.arguments
              //     as SuccessScreenArguments,
              arguments: ModalRoute.of(context).settings.arguments
                  as SuccessScreenArguments,
            ),
        Routes.FAILURE_SCREEN: (context) => FailureScreen(
              // arguments: ModalRoute.of(context)!.settings.arguments
              //     as FailureScreenArguments,
              arguments: ModalRoute.of(context).settings.arguments
                  as FailureScreenArguments,
            ),
      },
    );
  }
}
