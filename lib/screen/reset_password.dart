import 'package:belajarfirebase/provider/auth.dart';
import 'package:belajarfirebase/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailC = TextEditingController();
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
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
            ElevatedButton(
              onPressed: () {
                auth.resetPassword(emailC.text);
                Navigator.pop(context);
              },
              child: Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}
