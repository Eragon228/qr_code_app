import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'QR_Code_App.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("jopa");
  print(app.options);
  print(app.name);
  runApp(const QR_Code_App());
}
