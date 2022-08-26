import 'package:belajarfirebase/provider/auth.dart';
import 'package:belajarfirebase/provider/storage.dart';
import 'package:belajarfirebase/provider/users.dart';
import 'package:belajarfirebase/screen/login_screen.dart';
import 'package:belajarfirebase/screen/register_screen.dart';
import 'package:belajarfirebase/screen/upload_screen.dart';
import 'package:belajarfirebase/screen/users_screen.dart';
import 'package:belajarfirebase/screen/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Users(),
          ),
          ChangeNotifierProvider(
            create: (context) => Storage(),
          ),
          ChangeNotifierProvider(
            create: (context) => Auth(),
          ),
        ],
        child: Wrapper(),
      ),
    );
  }
}
