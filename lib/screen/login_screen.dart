import 'package:belajarfirebase/provider/auth.dart';
import 'package:belajarfirebase/screen/register_screen.dart';
import 'package:belajarfirebase/screen/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailC = TextEditingController();
    TextEditingController passwordC = TextEditingController();
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    auth.login(emailC.text, passwordC.text);
                  },
                  child: Text("Login"),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                          create: (context) => Auth(),
                          child: RegisterScreen(),
                        ),
                      ),
                    );
                  },
                  child: Text("Register"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                          create: (context) => Auth(),
                          child: ResetPassword(),
                        ),
                      ),
                    );
                  },
                  child: Text("Reset Password"),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                auth.signInWithGoogle();
              },
              child: Text("Sign'in with google account"),
            ),
            ElevatedButton(
              onPressed: () {
                auth.signInWithAnom();
              },
              child: Text("Sign'in with Anonymous Account"),
            ),
          ],
        ),
      ),
    );
  }
}
