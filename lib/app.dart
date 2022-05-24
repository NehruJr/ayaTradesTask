import 'package:flutter/material.dart';

import 'utils/theme.dart';
import 'view/auth_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aya Trades Task',
      theme: AuthTheme().appTheme(),
      home: const AuthView(),
    );
  }
}
