import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../provider/users.dart';

class AddUsers extends StatelessWidget {
  const AddUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: users.firstnameC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Nama Depan'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: users.lastnameC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Nama Belakang'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: users.ageC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                users.addUser();
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
