import 'package:flutter/material.dart';
import '/router/routes.dart';
import '/theme/theme.dart';

class QR_Code_App extends StatelessWidget {
  const QR_Code_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory App',
      theme: darkTheme,
      routes: routes,
    );
  }
}