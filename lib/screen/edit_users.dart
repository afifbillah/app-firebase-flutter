import '../provider/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class EditUsers extends StatelessWidget {
  EditUsers({required this.idDoc, Key? key}) : super(key: key);
  String idDoc;

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: users.getUserByIdDoc(idDoc),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final data = snapshot.data!.data() as Map<String, dynamic>;
              users.firstnameC.text = data['firstname'];
              users.lastnameC.text = data['lastname'];
              users.ageC.text = data['age'];
              return Padding(
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
                        label: Text('Umur'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        users.updateUser(idDoc);
                        Navigator.pop(context);
                      },
                      child: Text('Edit'),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
