import 'package:belajarfirebase/provider/auth.dart';
import 'package:belajarfirebase/screen/login_screen.dart';
import 'package:belajarfirebase/screen/users_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return StreamBuilder<User?>(
        stream: auth.changeState(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.active) {
            return (snapshot.data != null) ? UserScreen() : LoginScreen();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
