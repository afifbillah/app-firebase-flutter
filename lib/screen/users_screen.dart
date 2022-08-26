import 'package:belajarfirebase/provider/users.dart';
import 'package:belajarfirebase/screen/add_users.dart';
import 'package:belajarfirebase/screen/edit_users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => Users(),
                child: AddUsers(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: users.streamUsers(),
          builder: (context, snapshot) {
            // print(snapshot.data!.docs[0].data());
            if (snapshot.connectionState == ConnectionState.active) {
              var data = snapshot.data!.docs;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final user = data[index].data() as Map<String, dynamic>;
                  return ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        users.deleteUser(data[index].id);
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                              create: (context) => Users(),
                              child: EditUsers(
                                idDoc: data[index].id,
                              )),
                        ),
                      );
                    },
                    title: Text(user['firstname']),
                    subtitle: Text("Age : ${user['age']}"),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
