import 'package:belajarfirebase/provider/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Storage storage = Provider.of<Storage>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload File'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            storage.UploadFile();
          },
          child: Text('Upload'),
        ),
      ),
    );
  }
}
