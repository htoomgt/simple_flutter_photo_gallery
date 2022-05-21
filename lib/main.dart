import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

void main() {
  runApp(KodetrApp());
}

class KodetrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Photo View',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Photo View'),
            ),
            body: PhotoView(
              imageProvider: const NetworkImage(
                  "https://blogplongee.fr/photos/fakarava/plus-belle-plage-au-monde.JPG"),
            )));
  }
}
